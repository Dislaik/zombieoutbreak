local Utils = M("Utils")

Module.RotationToDirection = function(rotation)
	local adjustedRotation = 
	{ 
		x = (math.pi / 180) * rotation.x, 
		y = (math.pi / 180) * rotation.y, 
		z = (math.pi / 180) * rotation.z 
	}
	local direction = 
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)), 
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

Module.RayCastGamePlayCamera = function(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = Module.RotationToDirection(cameraRotation)
	local destination = 
	{ 
		x = cameraCoord.x + direction.x * distance, 
		y = cameraCoord.y + direction.y * distance, 
		z = cameraCoord.z + direction.z * distance 
	}

	local a, b, c, d, e, f = GetShapeTestResultIncludingMaterial(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 1))
    
    return b, c, e, f
end

Module.DrawPolygon = function(points, target, height, r, g, b, a)

    for i = 1, #points do
        if points[i + 1] then
            Utils.WallPointToPoint(points[i], points[i + 1], (height / 2), r, g, b, a)
        else
            Utils.WallPointToPoint(points[i], points[1], (height / 2), r, g, b, a)
        end
        --Utils.DrawText3D(i .."\n".. points[i], points[i].x, points[i].y, points[i].z, 0.5, 4)
    end

    return Module.OnPolygon(points, height, target)
end

Module.DrawBox = function(coord, target, width, length, height, rotation, r, g, b, a)
    local points = {
        vector3(coord.x - (width / 2), coord.y + (length / 2), coord.z + (height / 2)),
        vector3(coord.x + (width / 2), coord.y + (length / 2), coord.z + (height / 2)),
        vector3(coord.x + (width / 2), coord.y - (length / 2), coord.z + (height / 2)),
        vector3(coord.x - (width / 2), coord.y - (length / 2), coord.z + (height / 2))
    }
    local newPoints = {}

    for i = 1, #points do
        local currentPoint = Utils.RotateCoord(coord, points[i], rotation)
        if points[i + 1] then
            local afterPoint = Utils.RotateCoord(coord, points[i + 1], rotation)
            Utils.WallPointToPoint(currentPoint, afterPoint, (height / 2), r, g, b, a)
        else
            local firstPoint = Utils.RotateCoord(coord, points[1], rotation)
            Utils.WallPointToPoint(currentPoint, firstPoint, (height / 2), r, g, b, a)
        end

        --Utils.DrawText3D(i .."\n".. currentPoint, currentPoint.x, currentPoint.y, currentPoint.z, 0.5, 4)
        newPoints[i] = currentPoint
    end 

    return Module.OnBox(newPoints, height, target)
end


Module.OnPolygon = function(polygons, height, targetCoords)
    local j = #polygons

    for i = 1, #polygons do
        if (polygons[i].y < targetCoords.y and polygons[j].y >= targetCoords.y or polygons[j].y < targetCoords.y and polygons[i].y >= targetCoords.y) then
            if (polygons[i].x + ( targetCoords.y - polygons[i].y ) / (polygons[j].y - polygons[i].y) * (polygons[j].x - polygons[i].x) < targetCoords.x) then
                if polygons[i].z < targetCoords.z and polygons[j].z + height > targetCoords.z then
                    return true
                end
            end
        end
        j = i;
    end

    return false
end

Module.OnBox = function(polygons, height, targetCoords)
    return Module.OnPolygon(polygons, height, targetCoords)
end
