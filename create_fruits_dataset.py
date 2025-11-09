#!/usr/bin/env python3
"""
Create a simple fruits dataset for Level 3 image classification
"""

import os
import numpy as np
from PIL import Image, ImageDraw, ImageFont
import zipfile

def create_fruit_image(fruit_type, size=(64, 64)):
    """Create a simple fruit image"""
    img = Image.new('RGB', size, color='white')
    draw = ImageDraw.Draw(img)
    
    # Draw a simple fruit shape
    center_x, center_y = size[0] // 2, size[1] // 2
    
    if fruit_type == 'apple':
        # Red circle for apple
        draw.ellipse([center_x-20, center_y-20, center_x+20, center_y+20], fill='red', outline='darkred')
        # Green stem
        draw.rectangle([center_x-2, center_y-25, center_x+2, center_y-20], fill='green')
    elif fruit_type == 'banana':
        # Yellow banana shape
        draw.ellipse([center_x-15, center_y-20, center_x+15, center_y+15], fill='yellow', outline='brown')
        # Banana curve
        draw.arc([center_x-10, center_y-18, center_x+10, center_y+12], 0, 180, fill='brown', width=2)
    elif fruit_type == 'orange':
        # Orange circle
        draw.ellipse([center_x-18, center_y-18, center_x+18, center_y+18], fill='orange', outline='darkorange')
        # Orange texture
        for i in range(5):
            x = center_x + np.random.randint(-10, 10)
            y = center_y + np.random.randint(-10, 10)
            draw.ellipse([x-2, y-2, x+2, y+2], fill='darkorange')
    
    return img

def create_fruits_dataset():
    """Create fruits dataset"""
    fruits = ['apple', 'banana', 'orange']
    samples_per_fruit = 30
    
    # Create directories
    os.makedirs('seed_data/level3', exist_ok=True)
    
    for fruit in fruits:
        fruit_dir = f'seed_data/level3/{fruit}'
        os.makedirs(fruit_dir, exist_ok=True)
        
        for i in range(samples_per_fruit):
            # Add some variation
            size = (64 + np.random.randint(-8, 8), 64 + np.random.randint(-8, 8))
            img = create_fruit_image(fruit, size)
            
            # Add some noise for variation
            img_array = np.array(img)
            noise = np.random.randint(-20, 20, img_array.shape)
            img_array = np.clip(img_array + noise, 0, 255).astype(np.uint8)
            img = Image.fromarray(img_array)
            
            # Save image
            img.save(f'{fruit_dir}/{fruit}_{i:02d}.png')
    
    # Create zip file
    with zipfile.ZipFile('seed_data/level3/fruits_small.zip', 'w') as zipf:
        for fruit in fruits:
            fruit_dir = f'seed_data/level3/{fruit}'
            for filename in os.listdir(fruit_dir):
                if filename.endswith('.png'):
                    zipf.write(os.path.join(fruit_dir, filename), f'{fruit}/{filename}')
    
    print("Fruits dataset created successfully!")
    print("Files created:")
    for fruit in fruits:
        print(f"  - {fruit}/: 30 images")
    print("  - fruits_small.zip: Complete dataset")

if __name__ == "__main__":
    create_fruits_dataset()
