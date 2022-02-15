function [pos, tri] = remove_double_vertices(pos, tri)

% REMOVE_DOUBLE_VERTICES removes double vertices from a triangular mesh,
% renumbering the vertex-indices for the triangles.
%
% Use as
%   [pos, tri] = remove_double_vertices(pos, tri)

% Copyright (C) 2004-2022, Robert Oostenveld and Jan-Mathijs Schoffelen
%
% This file is part of FieldTrip, see http://www.fieldtriptoolbox.org
% for the documentation and details.
%
%    FieldTrip is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    FieldTrip is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with FieldTrip. If not, see <http://www.gnu.org/licenses/>.
%
% $Id$

[dum, i1, i2] = unique(pos, 'rows');
clear dum

% re-index the indices in tri
tri = i1(i2(tri));

% remove the vertices and triangles
pos = pos(i1, :);
