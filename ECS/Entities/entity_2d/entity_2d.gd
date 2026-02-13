@warning_ignore("missing_tool")
extends Entity

# Entities by default are Nodes, NOT Node2Ds or Node3Ds.
# This means they don't have positional data.
# This fixes that, by making a Node2D extend Entity!
# Copy this scene and script to make an entity prefab, an entity with a predefined set of child nodes and components.
