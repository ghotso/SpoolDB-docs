# Multi-stage build for Docusaurus documentation site

# Stage 1: Build the Docusaurus site
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source files
COPY . .

# Build the site
RUN npm run build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy built site from builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Copy nginx configuration (optional, for custom routing)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

