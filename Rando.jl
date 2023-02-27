import CairoMakie
using Random, Colors

framerate = 24
rng = Random.default_rng()

function randomImage(rng)
     M = Matrix{RGB{Float32}}(undef, 1000, 1000)
     @. M = RGB(rand(rng), rand(rng), rand(rng))
     return M
end

img = randomImage(rng)
scene = CairoMakie.Scene(resolution = reverse(size(img)))
makieimg = CairoMakie.image!(scene, img)
display(scene)
timestamps = 0:1/framerate:2


record(scene, "noise_animation.mp4", timestamps) do i
    img = randomImage(rng)
    makieimg[1]= img
end
