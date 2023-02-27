using Cairo, Colors

# Set up the graphics context
width, height = 500, 500
surface = Cairo.CairoPDF("ball_movement.pdf", width, height)
ctx = CairoContext(surface)

# Set up the initial position and velocity of the ball
x, y = 100, 100
vx, vy = 2, 3
radius = 20

# Define a function to update the position of the ball
function update_ball_position()
    # Update the position of the ball
    x += vx
    y += vy

    # Check for collisions with the edges of the screen
    if x < radius || x > width - radius
        vx = -vx
    end
    if y < radius || y > height - radius
        vy = -vy
    end
end

# Define a function to draw the ball on the screen
function draw_ball()
    set_source_rgb(ctx, 1.0, 1.0, 1.0) # Set the color to white
    arc(ctx, x, y, radius, 0, 2π) # Draw a circle
    fill(ctx) # Fill the circle with color
end

# Main loop: update the ball position and redraw the screen
for i = 1:500
    update_ball_position()
    draw_ball()
    showpage(ctx)
end

# Clean up the graphics context
finish(ctx)
