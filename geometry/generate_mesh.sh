#!/bin/bash

# Set the script to exit immediately if any command fails
set -e

# Define file names
mesh_file="qubit_v1_mesh.msh"
exo_file="qubit_v1_mesh.exo"

# Delete old mesh files if they exist
echo "Checking and removing old mesh files..."
[ -f "$mesh_file" ] && rm "$mesh_file"
[ -f "$exo_file" ] && rm "$exo_file"
echo "Old files removed."

# Generate the mesh using Gmsh in non-GUI mode
echo "Generating mesh with Gmsh..."
gmsh qubit_v1.geo -3 -o $mesh_file

# Convert the mesh file to Exodus format using meshio
echo "Converting mesh to Exodus format with meshio..."
meshio convert $mesh_file $exo_file

echo "Conversion completed successfully!"
