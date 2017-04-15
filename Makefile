
all: pattern_triangles.svg

%.svg: %.scad
	openscad $^ -o $@

clean:
	rm -f pattern*.svg

