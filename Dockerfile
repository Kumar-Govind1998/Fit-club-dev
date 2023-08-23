FROM node:16.13.0
     
# Set user to root to perform package installation
USER root

# Update package information
RUN apt-get -y update

# Create and set the working directory
WORKDIR /app

# Copy package.json and package-lock.json files to the working directory
COPY package.json package-lock.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port that the application will run on
EXPOSE 3000

# Provide necessary permissions to node_modules (Note: Use more specific permissions if possible)
RUN chmod  777 /app/node_modules/*

# Start the application
CMD ["npm", "start"]

