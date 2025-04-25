
target := build/out


srcs := main.cpp file2.cpp

obj_path := build/obj
src_path := src

params:= -Wall -g -Iinclude -Llib 

# copy of srcs but with extension .o
objs = $(srcs:.cpp=.o)



all: $(target)

# build all together command
$(target): $(objs)
	g++ $(params) -o $(target) $(addprefix $(obj_path)/,$^)



#obj directory   -ignore errors
$(obj_path):
	mkdir $(obj_path)



#compile objects

%.o: $(src_path)/%.cpp
	g++ $(params) -c $^ -o $(obj_path)/$@


# @ is silent
run: $(target)
	@echo Running program $(target)
	@$(target)

clean:
	-rm -f $(obj_path)/$(objs)
	-rmdir $(obj_path)
	