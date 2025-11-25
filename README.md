# Effective Data Visualization in Research  
### University of Oulu, Finland — 3 December 2025

---

## Summary

This 2–3 hour workshop introduces participants to the essential concepts and practical methods required to create high-quality scientific figures. The course covers technical image parameters (DPI, resolution, RGB/CMYK), principles of effective visualization, molecular graphics in PyMOL, and data visualization in R and ggplot2. Participants will learn how to prepare publication-ready images, select appropriate chart types, avoid common visualization pitfalls, and present complex data in a clear, reproducible, and aesthetically compelling way.

---

# Table of Contents

### Main Sections
1. [Introduction](#introduction)
   - [Pixels, PPI, DPI](#pixels-ppi-dpi)  
   - [Image Resolution](#image-resolution)  
   - [RGB vs CMYK](#rgb-vs-cmyk)  
   - [Raster vs Vector Graphics](#raster-vs-vector-graphics)  
3. [Minimum Hardware and Software Requirements](#2-minimum-hardware-and-software-requirements)
4. [Principles of Good Scientific Visualization](#principles-of-good-scientific-visualization)  
5. [Molecular Graphics in PyMOL](#molecular-graphics-in-pymol)  
   - [PyMOL Rendering Workflow](#pymol-rendering-workflow)  
   - [PyMOL Rendering Script](#pymol-rendering-script)  
6. [Tools for Scientific Figure Preparation](#tools-for-scientific-figure-preparation)  
7. [Data Visualization in R](#data-visualization-in-r)  
   - [Base R Plots](#base-r-plots)  
   - [ggplot2 Fundamentals](#ggplot2-fundamentals)  
   - [Exporting Publication-Ready Figures](#exporting-publication-ready-figures)  
   - [Scatterplot: 2–7 Dimensions](#scatterplot-27-dimensions)  
8. [Exercises](#exercises)

---

# 1. Introduction
[↑ Back to top](#effective-data-visualization-in-research)

### Definitions

#### **Computer Graphics**
Computer graphics is a field of computer science focused on generating, processing, and presenting visual content using computational methods. It encompasses techniques such as raster and vector image creation, 3D modeling, rendering, and data visualization. Its primary purpose is to communicate information through visual representations, ensuring clarity, quality, realism, or aesthetic appeal depending on the application.

#### **Molecular Graphics**
Molecular graphics is a specialized branch of computer graphics dedicated to the visual representation of biochemical structures and phenomena at the atomic and molecular levels. It relies on experimental structural data (e.g., PDB, Cryo-EM, NMR) and computational modeling to depict molecular shapes, geometry, interactions, and properties. Molecular graphics serves not only as a form of illustration but also as a tool for structural analysis, drug design, and the communication of biological research results.

#### **Visualization**
Visualization is the process of transforming data, phenomena, or abstract information into graphical representations that facilitate understanding, analysis, and communication. It applies to quantitative data (e.g., plots, heatmaps), spatial structures (e.g., 3D renderings), and conceptual information. Effective visualization highlights patterns, relationships, and insights that may be difficult to detect from raw numerical or textual data.

#### **Pixel — with Color Depth**
A pixel is the smallest addressable unit of a raster (bitmap) image.  
Each pixel stores numerical color information defined by its **color depth** (bit depth), expressed as bits per channel (bpc).

Common depths:
- **8 bits per channel (8 bpc)** — 256 tonal values per channel, ~16.7 million colors (standard RGB)
- **16 bits per channel (16 bpc)** — 65,536 values per channel (high-precision imaging)
- **1 bit per pixel (1 bpp)** — black–white binary graphics

Most scientific journals accept **8 bpc RGB TIFF**.

---

### PPI vs DPI

| Term | Meaning | Used for |
|------|---------|----------|
| **PPI (Pixels Per Inch)** | pixel density on a display | screens |
| **DPI (Dots Per Inch)** | ink dot density | print |

Scientific journals typically require **300 DPI** for figures.

#### Illustration

![](https://images.squarespace-cdn.com/content/v1/55942b87e4b0b32d29a6a718/1475072926824-8DF9TWOXRGL5FUMJVYEF/image-asset.jpeg?format=2500w)  
Source: *Squarespace CDN / Online DPI Tutorial*

---


### Image Resolution and Graphic Size

Defined as *width × height in pixels*.  
Final physical size = pixels ÷ DPI.

It depends on pixel count and DPI:
size_mm = (pixels / DPI) × 25.4

Example:  
3000 px at 300 DPI → **254 mm** printed width.

Resolution determines detail while DPI determines printing density.

#### Illustration: Image Resolution

![](https://cdn.mos.cms.futurecdn.net/rVFdr58RWyweYuMjw5yC7h-650-80.jpg.webp)  
Source: *Future Publishing / Digital Camera World*

---

### Color Spaces

- **RGB** — screen visualization  
- **CMYK** — print production  

A **color space** defines how numerical color values map to visible colors.  
Different devices (monitors, printers, cameras) interpret and reproduce colors differently.

Most scientific journals require:
- **RGB** for online submission  
- **CMYK** for print-ready figures  

---

#### **RGB (Red–Green–Blue)**

RGB is an **additive color model** used for screens.  
Each pixel’s color is defined by the intensity of three channels:

R, G, B ∈ 0–255

Examples:
- **(255, 0, 0)** → pure red  
- **(0, 255, 0)** → pure green  
- **(0, 0, 255)** → pure blue  
- **(255, 255, 255)** → white (all channels at max brightness)  
- **(0, 0, 0)** → black (no emitted light)  
- **(255, 0, 100)** → a shade of magenta/purple  
- **(200, 200, 0)** → yellowish tone

RGB colors are also commonly encoded in **hexadecimal notation**:
#RRGGBB


Examples:
- **#FF0000** → red  
- **#00FF00** → green  
- **#0000FF** → blue  
- **#FFFFFF** → white  
- **#000000** → black  
- **#FF0064** → pink/magenta shade  
- **#C8C800** → yellow-green  

Hex values range from **00** (0) to **FF** (255).

---

#### **CMYK (Cyan–Magenta–Yellow–Key Black)**

CMYK is a **subtractive color model** used in printing.  
Instead of emitting light, inks absorb (subtract) parts of the spectrum.

Color is defined by four components:

C, M, Y, K ∈ 0–100%

Examples:
- **(0%, 100%, 100%, 0%)** → red  
- **(100%, 0%, 100%, 0%)** → green  
- **(100%, 100%, 0%, 0%)** → blue  
- **(0%, 0%, 0%, 0%)** → white (no ink)  
- **(0%, 0%, 0%, 100%)** → black  
- **(0%, 50%, 0%, 0%)** → magenta tint  
- **(0%, 0%, 50%, 0%)** → yellow tint  

Because CMYK describes ink coverage, **a pixel’s color is created by overlapping inks**:
- more cyan ink → more blue/green coloration  
- more magenta ink → more red/pink coloration  
- more yellow ink → more yellow/orange coloration  
- adding black reduces brightness and saturates shadows  

---

### Journal Conventions
- Online PDFs → **RGB**  
- Print production → **CMYK**  
- Some publishers perform automatic conversion  
- For complex figures (Ray-traced molecules, microscopy) RGB is generally preferred  

#### Illustration: RGB vs CMYK

![](https://usercontent.one/wp/www.schlaugemacht.net/wp-content/uploads/2021/01/tube-screen-1-1024x397.png)  
Source: https://www.schlaugemacht.net/what-is-rgb-and-cmyk/

---

### Raster vs vector

| Type | Pros | Cons |
|------|------|------|
| **Raster (PNG, TIFF, JPG)** | good for photos, heatmaps | loses quality when scaled |
| **Vector (PDF, SVG, EPS)** | fully scalable, ideal for plots | not suitable for photorealistic rendering |

#### Illustration: Raster vs Vector Comparison

![](https://blog.fileformat.com/pl/image/raster-vs-vector-images-a-brief-comparison/images/raster-vs-vector.jpg#center)  
Source: https://blog.fileformat.com/pl/image/raster-vs-vector-images-a-brief-comparison/

---

### Rendering (Rasterization)

Rendering is the computational process of generating a 2D image from a 3D model.  
In the rasterization approach, 3D objects are projected onto a 2D screen and converted into pixels.  
This method is fast and widely used in real-time graphics (e.g., video games, interactive viewers).

Rasterization determines:
- object visibility
- shading and color on surfaces
- projection from 3D to 2D pixel grid

#### Illustration: Rasterization vs Ray Tracing  
![](https://sapien.ucsd.edu/docs/2.2/_images/rst_vs_rt.png)  
Source: https://sapien.ucsd.edu/docs/2.2/  

More information:  
https://blog.3sfarm.com/ray-tracing-vs-rasterization-key-differences-and-uses

---

### Ray Tracing

Ray tracing is an advanced rendering method that simulates the physical behavior of light.  
Virtual rays are cast from the camera through the scene to determine:
- realistic shadows  
- soft lighting  
- reflections and refractions  
- accurate occlusion  

In molecular graphics (e.g., PyMOL), ray tracing significantly increases image clarity and publication quality.

#### Illustration: Ray Tracing Example  
![](https://d29g4g2dyqv443.cloudfront.net/sites/default/files/pictures/2018/RayTracing/ray-tracing-image-1.jpg)  
Source: NVIDIA (Ray Tracing Demo)

More information:  
https://developer.nvidia.com/discover/ray-tracing


#### **POV-Ray**
POV-Ray is a classic high-quality ray-tracing engine capable of producing photorealistic images using scene description code.  
Website: https://www.povray.org/



---

# 2. Minimum Hardware and Software Requirements
[↑ Back to top](#effective-data-visualization-in-research)

To fully participate in the workshop and complete all exercises, the following hardware and software components are required or recommended:

---

### **Required**

#### **Computer with Internet Access**
A laptop or desktop computer capable of connecting to the internet is essential.  
Several exercises use online environments and external datasets.

#### **Web Browser (Google Chrome, Firefox, Edge)**
Participants must be able to access **Google Colab**, which requires:  
- a modern web browser  
- the ability to log in using a **Google account**

#### **IrfanView**
A lightweight and fast graphics utility used during the workshop for:  
- reading image metadata  
- changing DPI  
- converting formats (TIFF, PNG)  
- resizing and exporting figures  

Download: https://www.irfanview.com/

---

### **Recommended**

#### **PowerPoint + Excel**
Useful for:  
- quick prototyping of charts  
- assembling multi-panel figures  
- simple image layout preparation  

Although not required for the course, these tools can speed up certain tasks.

#### **Inkscape or CorelDRAW**
Recommended for participants who want to refine high-quality figures.  
Ideal for:  
- vector graphics editing  
- preparing final layouts for publication  
- combining raster and vector components  

Free option: https://inkscape.org/  
Commercial option: https://www.coreldraw.com/

#### **PyMOL**
Recommended for generating high-quality molecular graphics.  
PyMOL will be used in the workshop to demonstrate:
- molecular representations (cartoon, sticks, surface)
- color schemes for proteins, ligands, surfaces
- lighting, shading, ambient occlusion
- high-resolution rendering
- ray tracing for publication-quality images

Download / Info:  
https://www.pymol.org/

---

#### **POV-Ray (Optional, curiosity only)**
POV-Ray is an open-source ray-tracing engine capable of producing extremely high-quality photorealistic scenes.  
While not required for the workshop, it demonstrates how raw scene description languages can produce physically accurate images.

Website:  
https://www.povray.org/


---

# 3. Principles of Good Scientific Visualization
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

# 4. Molecular Graphics in PyMOL
[↑ Back to top](#effective-data-visualization-in-research)

## PyMOL Rendering Workflow
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

## PyMOL Rendering Script
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

# 5. Tools for Scientific Figure Preparation
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

# 6. Data Visualization in R
[↑ Back to top](#effective-data-visualization-in-research)

## Base R Plots
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

## ggplot2 Fundamentals
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

## Exporting Publication-Ready Figures
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

## Scatterplot: 2–7 Dimensions
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

# 7. Exercises
[↑ Back to top](#effective-data-visualization-in-research)

<< content to be added >>

---

# Acknowledgements

Workshop developed by  
**dr Jan Paweł Jastrzębski**  
University of Warmia and Mazury in Olsztyn

