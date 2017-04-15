
module triangle2(
            size_x,
            size_y
            )
{
    polygon([
        [-size_x/2, 0],
        [size_x/2, size_y/2],
        [size_x/2, -size_y/2]
        ]);
}

module triangle1(
            size_x,
            size_y
            )
{
    mirror([1,0,0])
    triangle2(size_x, size_y);
}

module pattern_triangles(
            count_x,
            count_y,
            triangle_x,
            triangle_y,
            spacing_x,
            spacing_y
            )
{
    dx = triangle_x + spacing_x;
    dy = triangle_y + spacing_y;

    // begin at (0,0)
    translate([
        triangle_x/2,
        triangle_y/2,
        0
        ])
    // all rows
    for (iy = [0:count_y-1])
    {
        translate([
            0,
            iy * dy,
            0
            ])
        {
            // all columns of outer rows
            for (ix = [0:count_x-1])
            {
                translate([
                    ix*2 * dx,
                    0,
                    0
                    ])
                triangle1(triangle_x, triangle_y);

                translate([
                    (ix*2+1) * dx,
                    0,
                    0
                    ])
                triangle2(triangle_x, triangle_y);
            }

            if (iy < count_y-1)
            {
                // all columns of inner rows
                for (ix = [0:count_x-1])
                {
                    translate([
                        ix*2 * dx,
                        0.5*dy,
                        0
                        ])
                    triangle2(triangle_x, triangle_y);

                    translate([
                        (ix*2+1) * dx,
                        0.5*dy,
                        0
                        ])
                    triangle1(triangle_x, triangle_y);
                }
            }
        }
    }
}

pattern_triangles(
    5, 4,
    5, 15,
    1, 3
    );
