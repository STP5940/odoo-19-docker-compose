# Dockerfile
FROM odoo:19.0

# ติดตั้ง dependency + wkhtmltopdf 0.12.6.1 (with patched qt)
USER root
RUN apt-get update

# ติดตั้งฟอนต์ไทย (TH Sarabun, TLWG Fonts)
RUN apt-get install -y \
    fonts-thai-tlwg \
    fonts-freefont-ttf \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

RUN fc-cache -f -v

USER odoo