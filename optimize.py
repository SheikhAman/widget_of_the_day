import os
import re
from PIL import Image

# Configuration
SCREENSHOTS_DIR = 'screenshots'
README_PATH = 'README.md'
QUALITY = 75  # Sharp quality, small size

def optimize_assets():
    print("🚀 Starting optimization of 100+ assets...")

    count = 0
    # 1. Process images in the screenshots folder
    for root, dirs, files in os.walk(SCREENSHOTS_DIR):
        for file in files:
            file_path = os.path.join(root, file)
            file_ext = file.lower().split('.')[-1]

            if file_ext in ['png', 'gif']:
                output_path = os.path.splitext(file_path)[0] + '.webp'

                try:
                    with Image.open(file_path) as img:
                        # Handle GIF (Convert to Animated WebP)
                        if file_ext == 'gif':
                            img.save(output_path, 'WEBP', save_all=True, quality=QUALITY, lossless=False)
                        # Handle PNG (Convert to Static WebP)
                        else:
                            img.save(output_path, 'WEBP', quality=QUALITY)

                    # Delete the original heavy file to save space
                    os.remove(file_path)
                    count += 1
                    print(f"✅ Optimized: {file} -> .webp")
                except Exception as e:
                    print(f"❌ Error processing {file}: {e}")

    print(f"\n✨ Success! {count} files converted to WebP.")

def update_readme():
    print("\n📝 Updating README.md links...")

    if not os.path.exists(README_PATH):
        print("⚠️ README.md not found.")
        return

    with open(README_PATH, 'r', encoding='utf-8') as f:
        content = f.read()

    # Smart regex to replace .png and .gif with .webp only for screenshots
    new_content = re.sub(r'(screenshots/.*?)\.(png|gif)', r'\1.webp', content)

    with open(README_PATH, 'w', encoding='utf-8') as f:
        f.write(new_content)

    print("✅ README.md links updated to .webp!")

if __name__ == "__main__":
    optimize_assets()
    update_readme()
    print("\n🎉 DONE! Your project is now lightweight and fast.")
