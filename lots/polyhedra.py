#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import math

icosahedron_faces = [
    (0, 11, 5),
    (0, 5, 1),
    (0, 1, 7),
    (0, 7, 10),
    (0, 10, 11),

    (1, 5, 9),
    (5, 11, 4),
    (11, 10, 2),
    (10, 7, 6),
    (7, 1, 8),

    (3, 9, 4),
    (3, 4, 2),
    (3, 2, 6),
    (3, 6, 8),
    (3, 8, 9),

    (4, 9, 5),
    (2, 4, 11),
    (6, 2, 10),
    (8, 6, 7),
    (9, 8, 1)
]

def kis_operator(vertices, faces):
    new_faces = []
    new_vertices = list(vertices)  # Make a copy of the original vertices
    edge_midpoint_indices = {}
    for face in faces:
        face_edge_midpoints = []
        for i in range(len(face)):
            v1 = face[i]
            v2 = face[(i + 1) % len(face)]

            edge_key = tuple(sorted([v1, v2]))
            if edge_key not in edge_midpoint_indices:
                midpoint = centroid([vertices[v1], vertices[v2]])
                midpoint_idx = len(new_vertices)
                edge_midpoint_indices[edge_key] = midpoint_idx
                new_vertices.append(midpoint)

            face_edge_midpoints.append(edge_midpoint_indices[edge_key])

        new_tri_faces = [
            (face[0], face_edge_midpoints[0], face_edge_midpoints[2]),
            (face[1], face_edge_midpoints[1], face_edge_midpoints[0]),
            (face[2], face_edge_midpoints[2], face_edge_midpoints[1]),
            (face_edge_midpoints[0], face_edge_midpoints[1], face_edge_midpoints[2])
        ]

        new_faces.extend(new_tri_faces)

    return new_vertices, new_faces

def icosahedron_vertices():
    phi = (1 + math.sqrt(5)) / 2
    vertices = [
        (-1, phi, 0),
        (1, phi, 0),
        (-1, -phi, 0),
        (1, -phi, 0),

        (0, -1, phi),
        (0, 1, phi),
        (0, -1, -phi),
        (0, 1, -phi),

        (phi, 0, -1),
        (phi, 0, 1),
        (-phi, 0, -1),
        (-phi, 0, 1)
    ]
    return vertices

def centroid(vertices):
    x, y, z = 0, 0, 0
    for vertex in vertices:
        x += vertex[0]
        y += vertex[1]
        z += vertex[2]
    return (x/len(vertices), y/len(vertices), z/len(vertices))

def dual_polyhedron(vertices, faces):
    dual_vertices = []
    face_to_vertex = {}
    for face_index, face in enumerate(faces):
        face_vertices = [vertices[i] for i in face]
        face_centroid = centroid(face_vertices)
        dual_vertices.append(face_centroid)
        face_to_vertex[face_index] = face_centroid

    dual_faces = {}
    for face_index, face in enumerate(faces):
        for i in range(len(face)):
            v1 = face[i]
            v2 = face[(i + 1) % len(face)]
            edge_key = tuple(sorted([v1, v2]))

            # Find the two adjacent faces sharing this edge
            adjacent_faces = [f_idx for f_idx, f in enumerate(faces) if v1 in f and v2 in f]
            if len(adjacent_faces) != 2:
                raise ValueError(f"Invalid polyhedron: Edge {edge_key} is not shared by exactly two faces")

            f1, f2 = adjacent_faces
            if edge_key not in dual_faces:
                dual_faces[edge_key] = (f1, f2)

    # Build the list of dual faces
    dual_faces_list = []
    for _, adjacent_faces in dual_faces.items():
        f1, f2 = adjacent_faces
        face1_vertex = face_to_vertex[f1]
        face2_vertex = face_to_vertex[f2]

        if face1_vertex not in dual_faces_list:
            dual_faces_list.append(face1_vertex)
        if face2_vertex not in dual_faces_list:
            dual_faces_list.append(face2_vertex)

    return dual_vertices, dual_faces_list


def project_to_sphere(vertices, radius=1):
    projected_vertices = []
    for x, y, z in vertices:
        length = math.sqrt(x**2 + y**2 + z**2)
        x_proj, y_proj, z_proj = radius * x / length, radius * y / length, radius * z / length

        # Convert to latitude and longitude
        latitude = math.degrees(math.asin(z_proj / radius))
        longitude = math.degrees(math.atan2(y_proj, x_proj))

        projected_vertices.append((x_proj, y_proj, z_proj, latitude, longitude))
    return projected_vertices


icosahedron_verts = icosahedron_vertices()
projected_icosahedron_verts = project_to_sphere(icosahedron_verts)
print("\nIcosahedron vertices projected onto a sphere of radius 1 (with latitude and longitude):")
for i, vertex in enumerate(projected_icosahedron_verts, start=1):
    x, y, z, lat, lon = vertex
    print(f"Vertex {i}: Cartesian ({x}, {y}, {z}), Spherical (lat: {lat}, lon: {lon})")


dodecahedron_verts, dodecahedron_faces = dual_polyhedron(icosahedron_verts, icosahedron_faces);
projected_dodecahedron_verts = project_to_sphere(dodecahedron_verts)
print("\nDodecahedron vertices projected onto a sphere of radius 1 (with latitude and longitude):")
for i, vertex in enumerate(projected_dodecahedron_verts, start=1):
    x, y, z, lat, lon = vertex
    print(f"Vertex {i}: Cartesian ({x}, {y}, {z}), Spherical (lat: {lat}, lon: {lon})")

kis_vertices, kis_faces = kis_operator(icosahedron_verts, icosahedron_faces)
projected_pentakis_icosidodecahedron_verts = project_to_sphere(kis_vertices)
print("\nPentakis Icosidodecahedron vertices projected onto a sphere of radius 1 (with latitude and longitude):")
for i, vertex in enumerate(projected_pentakis_icosidodecahedron_verts, start=1):
    x, y, z, lat, lon = vertex
    print(f"Vertex {i}: Cartesian ({x}, {y}, {z}), Spherical (lat: {lat}, lon: {lon})")

kis_vertices2, kis_faces2 = kis_operator(kis_vertices, kis_faces)
projected_kis2_verts = project_to_sphere(kis_vertices2)
print("\nKis2 vertices projected onto a sphere of radius 1 (with latitude and longitude):")
for i, vertex in enumerate(projected_kis2_verts, start=1):
    x, y, z, lat, lon = vertex
    print(f"Vertex {i}: Cartesian ({x}, {y}, {z}), Spherical (lat: {lat}, lon: {lon})")

c320_verts, c320_faces= dual_polyhedron(kis_vertices2, kis_faces2);
projected_c320_verts = project_to_sphere(c320_verts);
print("\nC320 vertices projected onto a sphere of radius 1 (with latitude and longitude):")
for i, vertex in enumerate(projected_c320_verts, start=1):
    x, y, z, lat, lon = vertex
    print(f"Vertex {i}: Cartesian ({x}, {y}, {z}), Spherical (lat: {lat}, lon: {lon})")




