using Colors, CairoMakie, Luxor
struct blob
    id::Int
    position::Point
    velocity::Point
    color::Union{NTuple, Colorant, String}
    ballradius::Float64
end

    println("1")
function main()
    Sin = blob(1,(0,0),(0,0),Luxor.julia_purple,1)
    println(Sin)
    set_theme!(backgroundcolor = :gray90)

    f = Figure(resolution = (800, 500))
    ax = Axis(f[1, 1], aspect = 1)
    Colorbar(f[1, 2])
    f 
    savefig("test")
end

main()
