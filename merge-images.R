# Load the magick package
library(magick)

# Read the two images
image1 <- image_read("/Users/vivienchebii/Documents/new-plots/Manhatan-FG24.png")  # Replace with your file path
image2 <- image_read("/Users/vivienchebii/Documents/new-plots/FG-locuszoom.png")  # Replace with your file path

# Get dimensions of the images
dim1 <- image_info(image1)
dim2 <- image_info(image2)

# Check the heights of both images
height1 <- dim1$height
height2 <- dim2$height

# Resize the larger image to match the height of the smaller one
if (height1 > height2) {
  image1 <- image_resize(image1, paste0(dim2$width, "x", height2, "!"))  # Resize image1 to match height2
} else if (height2 > height1) {
  image2 <- image_resize(image2, paste0(dim1$width, "x", height1, "!"))  # Resize image2 to match height1
}

# Combine the images vertically
combined_image <- image_append(c(image1, image2), stack = TRUE)

# Display the combined image
print(combined_image)

# Save the combined image (optional)
image_write(combined_image, path = "combined_image.jpg", format = "jpg")
