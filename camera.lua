-- https://lua.expert/
local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, _, _2, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86

if LPH_OBFUSCATED then
	v1 = _G.NEXT
	v2 = _G.classes
	v3 = v2.UI
	v4 = v2.FPS
	v5 = v2.Character
	v6 = v2.Player
	v7 = v2.InputManager
	v8 = v2.EntityClient
	v9 = game:GetService("RunService")
	v10 = game:GetService("UserInputService")
	v11 = workspace.Terrain
	v12 = workspace.Const.Ignore
	v13 = workspace.CurrentCamera
	v14 = workspace.Const.Ignore.HLPart
	v15 = workspace.Const.Ignore.FPSArms
	v16 = workspace:GetAttribute("WaterLevel")
	v17 = math.cos
	v18 = math.abs
	v19 = math.clamp
	v20 = os.clock
	v21 = math.noise
	_ = math.max
	_2 = math.min
	v22 = coroutine.wrap
	v23 = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 41 | Upvalues: v21 (copy), v20 (copy) ]]
		return v21(0.5, v20() * p13, 8878)
	end)
	v24 = Vector2.new
	v25 = Vector3.new
	v26 = CFrame.new
	v27 = math.min
	v28 = CFrame.fromOrientation
	v29 = v26(0, 0, 0)
	v30 = RaycastParams.new()
	v30.FilterDescendantsInstances = { workspace.Const.Ignore }
	v30.FilterType = Enum.RaycastFilterType.Exclude
	v31 = Enum.MouseBehavior.LockCenter
	v32 = Enum.MouseBehavior.Default
	v33 = nil
	v34 = nil
	v35 = nil
	v36 = v24()
	v37 = 1
	v38 = 0.5
	v39 = 70
	v40 = v39
	v41 = v24()
	v42 = 1
	v43 = false
	v44 = Vector3.new(0, 0, 0)
	v45 = Vector3.new(0, 0, 0)
	v46 = v26(0, 0, 0)
	v47 = v26(0, 0, 0)
	v13.CFrame = v47
	v48 = v26(0, 0, 0)
	v49 = Vector3.new(0, 0, 0)
	v50 = 0
	v51 = v26(0, -2.4, -1)
	v52 = v26(0, 0, 0)
	v53 = nil
	v54 = nil
	v55 = v28(0, 0, 0)
	v56 = v28(0, 0, 0)
	v57 = v26(0, 0, 0)
	v58 = v26(0, -0.1, 0) * v28(-0.2, 0, 0)
	v59 = v26(0, -0.05, 0) * v28(-0.15, 0, 0)
	v60 = v26(0, 0, 0)
	v61 = v26(0, 0, 0)
	v62 = v20()
	v63 = 0.5
	v64 = 0.5
	v65 = nil
	v66 = false
	v67 = 0
	v68 = 0
	v69 = 0
	v70 = false
	v71 = 0
	v72 = nil
	v73 = v25()
	v74 = nil
	v75 = nil
	v76 = nil
	v77 = 0
	v78 = nil
	v1.init = LPH_NO_VIRTUALIZE(function() --[[ Line: 120 | Upvalues: v33 (ref), v3 (copy), v34 (ref), v35 (ref), v9 (copy), v78 (ref), v10 (copy), v41 (ref), v24 (copy), v13 (copy) ]]
		v33 = v3.GetFPSFrame().ScopeUIs
		v34 = v33:GetChildren()
		v35 = v3.GetFPSFrame().Flashbang
		v9:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value, v78)
		v10.InputChanged:Connect(function(p13, p23) --[[ Line: 128 | Upvalues: v41 (ref), v24 (ref) ]]
			if p13.UserInputType ~= Enum.UserInputType.Gamepad1 or p13.KeyCode ~= Enum.KeyCode.Thumbstick2 then
				return
			end

			if p13.Position.Magnitude > 0.3 then
				v41 = v24(p13.Position.X, -p13.Position.Y)

				return
			end

			v41 = v24(0, 0)
		end)
		v13.CameraType = Enum.CameraType.Scriptable
	end)
	v79 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 142 | Upvalues: v19 (copy) ]]
		return v19(1 - (1 - p13) ^ p23, 0, 1)
	end)
	v80 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 146 ]]
		local sum2 = p13 - p23

		if sum2 > math.pi then
			sum2 = sum2 - 6.283185307179586
		end

		if sum2 < -3.141592653589793 then
			sum2 = sum2 + 6.283185307179586
		end

		return sum2
	end)
	v81 = LPH_NO_VIRTUALIZE(function(p13, p23, p33) --[[ Line: 157 | Upvalues: v80 (copy) ]]
		local v1 = p13 % 6.283185307179586
		local v2 = p23 % 6.283185307179586
		local v3 = v80(v2, v1)

		if p33 <= v3 then
			return v2 - p33
		end

		if v3 <= -p33 then
			return v2 + p33
		end

		return v1
	end)
	v82 = 0
	v83 = 0
	v78 = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 173 | Upvalues: v82 (ref), v27 (copy), v69 (ref), v50 (ref), v3 (copy), v35 (ref), v68 (ref), v72 (ref), v73 (ref), v10 (copy), v31 (copy), v83 (ref), v32 (copy), v65 (ref), v41 (ref), v42 (ref), v19 (copy), v46 (ref), v30 (copy), v8 (copy), v6 (copy), v13 (copy), v40 (ref), v79 (copy), v54 (ref), v36 (ref), v24 (copy), v7 (copy), v39 (ref), v43 (ref), v49 (ref), v45 (ref), v25 (copy), v66 (ref), v76 (ref), v74 (ref), v75 (ref), v81 (copy), v77 (ref), v44 (ref), v26 (copy), v28 (copy), v67 (ref), v48 (ref), v21 (copy), v20 (copy), v29 (copy), v47 (ref), v14 (copy), v55 (ref), v17 (copy), v70 (ref), v53 (ref), v52 (ref), v51 (ref), v60 (ref), v61 (ref), v63 (ref), v62 (ref), v64 (ref), v56 (ref), v18 (copy), v5 (copy), v57 (ref), v58 (copy), v59 (copy), v4 (copy), v11 (copy), v16 (copy) ]]
		local v1 = v27(v82, p13)

		v82 = p13
		v69 = v69 + v1 * v50

		local v2 = v1 * 60
		local v33 = v3.GetShouldMouseLock()
		local v410 = Vector3.new(0, 0, 0)

		v35.BackgroundTransparency = v68

		if v68 < 1 then
			v68 = v68 + v1
		end

		if v33 then
			if v72 then
				v410 = v72.Position - v73
				v73 = v72.Position
			end

			v10.MouseBehavior = v31
			v10.MouseIconEnabled = false
			v83 = v83 + v1
		else
			v10.MouseBehavior = v32
			v10.MouseIconEnabled = true
			v83 = 0
		end

		if not v65 then
			return
		end

		v42 = if v41.Magnitude > 0.75 then v19(v42 + v1 * 15, 1, 5) else 1

		local v510 = workspace:Raycast(v46.Position, v46.LookVector * 75, v30)

		if v510 then
			local v610 = v8.GetEntityFromPart(v510.Instance)

			if v610 and v610:Inherits(v6) then
				v42 = 1
			end
		end

		local v78 = v13

		v78.FieldOfView = v78.FieldOfView + (v40 - v13.FieldOfView) * v79(v54 or 0.1, v2)
		v36 = if v33 and not (v83 < 0.05) then if v7.InputDevice == "Mobile" then v410 / 50 * (v40 / v39) else (v10:GetMouseDelta() / 120 + v41 * v42 * v1) * (v13.FieldOfView / v39) else v24(0, 0)

		if v43 then
			v49 = v25(v19(v49.X - v36.Y, -1.75 - v45.X, 1.75 - v45.X), v19(v49.Y - v36.X, -1.5, 1.5), v49.Z)
		else
			if not v66 then
				v49 = v49:Lerp(Vector3.new(0, 0, 0), v79(0.2, v2))
			end

			if v76 then
				local _, v84, _22 = v65.CFrame:ToOrientation()

				v45 = v25(v19(v45.X - v36.Y, v74 or -1.5, v75 or 1.5), v81(v45.Y - v36.X + v77, v84, v76), v45.Z)
			else
				v45 = v25(v19(v45.X - v36.Y, v74 or -1.5, v75 or 1.5), v45.Y - v36.X + v77, v45.Z)
			end
		end

		if v66 then
			v46 = v65.CFrame
		else
			v44 = v65.Position + Vector3.new(0, 1.3, 0)
			v46 = v26(v44) * v28(v45.X, v45.Y, v45.Z)
		end

		if v67 > 0 then
			v48 = v26(v21(0.5, v20() * v67 * 20, 32) * v67 * 4, v21(0.5, v20() * v67 * 20, 89) * v67 * 4, 0)
			v67 = v67 - v1 * 0.8
		else
			v48 = v29
		end

		v77 = 0
		v47 = v46 * v48 * v28(v49.X, v49.Y, v49.Z)
		v13.CFrame = v47
		v14.Position = v46.Position
		v14.CFrame = v14.CFrame:Lerp(v46, v79(0.5, v2))
		v55 = v55:Lerp(v28(v19(-v36.Y / 4, -0.4, 0.4), v19(-v36.X / 4, -0.4, 0.4), 0), v79(0.1, v2))

		local v9 = v17(v69 * 5) * 0.075 * v50
		local v102 = if v70 then v17(v20() * 1.2) * 0.04 else 0

		if v53 then
			v9 = v9 / 10
			v102 = 0
			v52 = v52:Lerp(v51:Inverse() * v53, v79(v54 or 0.2, v2))
		else
			v52 = v52:Lerp(v29, v79(0.1, v2))
		end

		v60 = v60:Lerp(v61, v79(v63, v2))

		if v62 <= v20() then
			v63 = v64
			v61 = v29
		end

		v56 = v56:Lerp(v26(v9, v18(v9 / 2) + v102, 0), v79(0.2, v2))
		v57 = if v5.IsGrounded() then if v5.IsSprinting() and not v53 then v57:Lerp(v59, v79(0.2, v2)) else v57:Lerp(v29, v79(0.2, v2)) else v57:Lerp(v58, v79(0.2, v2))

		local v112 = v51 * v55 * v56 * v52 * v57

		v4.ViewModel:PivotTo(v46 * v48 * v112 * (v112:Inverse() * v60 * v112))
		v11.WaterTransparency = v19((v44.Y - v16) * 0.25, 0.02, 0.25)
		v3.UpdateMap(v1)
	end)
	v1.SetBaseFOV = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 312 | Upvalues: v39 (ref), v40 (ref), v51 (ref), v26 (copy) ]]
		if p13 < 70 or p13 > 90 then
			error("invalid fov")
		end

		v39 = p13
		v40 = p13
		v51 = v26(0, -2.4 - (p13 - 70) * 0.01, (p13 - 70) * 0.02 + -1)
	end)
	v1.ScrollY = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 324 | Upvalues: v77 (ref) ]]
		v77 = v77 + p13
	end)
	v1.SetMaxRelativeLookExtentsY = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 328 | Upvalues: v76 (ref) ]]
		v76 = p13
	end)
	v1.SetMaxLookExtents = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 332 | Upvalues: v74 (ref), v75 (ref) ]]
		v74 = p13
		v75 = p23
	end)
	v1.FreeLook = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 337 | Upvalues: v43 (ref) ]]
		v43 = p13
	end)
	v1.SetZoom = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 341 | Upvalues: v37 (ref), v40 (ref), v39 (ref) ]]
		v37 = p13
		v40 = v39 / p13
	end)
	v1.IsZoomFinished = LPH_NO_VIRTUALIZE(function() --[[ Line: 346 | Upvalues: v40 (ref), v13 (copy), v18 (copy) ]]
		return v18(v40 - v13.FieldOfView) < 1
	end)
	v1.GetMouseDelta = LPH_NO_VIRTUALIZE(function() --[[ Line: 350 | Upvalues: v43 (ref), v24 (copy), v36 (ref) ]]
		if v43 then
			return v24()
		end

		return v36
	end)
	v1.SetMouseSensitivity = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 358 | Upvalues: v38 (ref) ]]
		v38 = p13
	end)
	v1.SetVMAimingOffset = LPH_NO_VIRTUALIZE(function(p13, p23, p33) --[[ Line: 362 | Upvalues: v34 (ref), v15 (copy), v12 (copy), v6 (copy), v33 (ref), v53 (ref), v54 (ref) ]]
		for v1, v2 in v34 do
			v2.Visible = false
		end

		v15.Parent = v12

		if p13 then
			if p33 == "Infrared" then
				v6.SetInfraredEnabled(true)
			end

			if p33 then
				v33[p33].Visible = true
				v15.Parent = nil
			end
		else
			v6.SetInfraredEnabled(false)
		end

		v53 = p13
		v54 = p23
	end)
	v1.SetVMInactiveState = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 383 ]] end)
	v1.GetCFrame = LPH_NO_VIRTUALIZE(function() --[[ Line: 387 | Upvalues: v46 (ref) ]]
		return v46
	end)
	v1.GetSubject = LPH_NO_VIRTUALIZE(function() --[[ Line: 391 | Upvalues: v47 (ref) ]]
		return v47
	end)
	v1.SetSubject = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 395 | Upvalues: v66 (ref), v65 (ref) ]]
		v66 = p23
		v65 = p13
	end)
	v1.Recoil = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 400 | Upvalues: v61 (ref), v26 (copy), v23 (copy), v28 (copy), v62 (ref), v20 (copy), v63 (ref), v64 (ref), v22 (copy), v7 (copy), v18 (copy), v27 (copy), v45 (ref), v25 (copy), v9 (copy) ]]
		v61 = v26(0, 0, p13.push)

		if p13.rotMag then
			v61 = v61 * v28(0, 0, v23(p13.rotSpeed) * p13.rotMag)
		end

		v62 = v20() + p13.returnTime
		v63 = p13.lerp
		v64 = p13.returnLerp or v63

		if not p13.cameraY then
			return
		end

		v22(function(p13, p23) --[[ Line: 411 | Upvalues: v7 (ref), v20 (ref), v18 (ref), v27 (ref), v45 (ref), v25 (ref), v9 (ref) ]]
			if v7.InputDevice == "Mobile" then
				return
			end

			local v1 = v20() - 1 / 60
			local v2 = v18(p13) * 2
			local v3 = v18(p23) * 2

			while p23 > 0 or (p13 > 0.01 or p13 < -0.01) do
				local v5 = v20() - v1

				if p23 > 0 then
					local v6 = v27(v5 * v3, p23)

					v45 = v45 + v25(v6, 0, 0)
					p23 = p23 - v6
				end

				if p13 > 0.01 or p13 < -0.01 then
					local v4

					v4 = if p13 <= 0 then -v27(v5 * v2, -p13) else v27(v5 * v2, p13)
					v45 = v45 + v25(0, v4, 0)
					p13 = p13 - v4
				end

				v9.RenderStepped:Wait()
			end
		end)(v23(p13.cameraXShake) * p13.cameraX, p13.cameraY)
	end)
	v1.Shake = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 448 | Upvalues: v67 (ref), v27 (copy) ]]
		v67 = v67 + p13
		v67 = v27(v67, 1)
	end)
	v1.Flash = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 453 | Upvalues: v68 (ref) ]]
		local v1 = -p13 + 1

		if not (v1 < v68) then
			return
		end

		v68 = v1
	end)
	v1.SetSwaySpeed = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 460 | Upvalues: v50 (ref), v70 (ref) ]]
		v50 = p13
		v70 = p13 == 0
	end)
	v1.GetX = LPH_NO_VIRTUALIZE(function() --[[ Line: 470 | Upvalues: v46 (ref) ]]
		local v1, _, _22 = v46:ToOrientation()

		return v1
	end)
	v1.GetY = LPH_NO_VIRTUALIZE(function() --[[ Line: 475 | Upvalues: v46 (ref) ]]
		local _, v1, _22 = v46:ToOrientation()

		return v1
	end)
	v84 = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 480 ]]
		local ViewportSize = workspace.CurrentCamera.ViewportSize

		if p13.X / ViewportSize.X < 0.33 and p13.Y / ViewportSize.Y > 0.25 then
			return true
		end
	end)
	v85 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 490 | Upvalues: v71 (ref), v72 (ref) ]]
		v71 = v71 - 1

		if v72 ~= p13 then
			return
		end

		v72 = nil
	end)
	v86 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 498 | Upvalues: v71 (ref), v10 (copy), v31 (copy), v84 (copy), v72 (ref), v73 (ref) ]]
		v71 = v71 + 1

		if v10.MouseBehavior ~= v31 or v84(p13.Position) then
			return
		end

		v72 = p13
		v73 = p13.Position
	end)
	v10.TouchEnded:Connect(v85)
	v10.TouchStarted:Connect(v86)

	return true
end

function LPH_JIT(...) --[[ Line: 2 ]]
	return ...
end
function LPH_CRASH(...) --[[ Line: 3 ]]
	return ...
end
function LPH_JIT_MAX(...) --[[ Line: 4 ]]
	return ...
end
function LPH_NO_VIRTUALIZE(...) --[[ Line: 5 ]]
	return ...
end
function LPH_ENCSTR(...) --[[ Line: 6 ]]
	return ...
end
function LPH_ENCNUM(...) --[[ Line: 7 ]]
	return ...
end
v1 = _G.NEXT
v2 = _G.classes
v3 = v2.UI
v4 = v2.FPS
v5 = v2.Character
v6 = v2.Player
v7 = v2.InputManager
v8 = v2.EntityClient
v9 = game:GetService("RunService")
v10 = game:GetService("UserInputService")
v11 = workspace.Terrain
v12 = workspace.Const.Ignore
v13 = workspace.CurrentCamera
v14 = workspace.Const.Ignore.HLPart
v15 = workspace.Const.Ignore.FPSArms
v16 = workspace:GetAttribute("WaterLevel")
v17 = math.cos
v18 = math.abs
v19 = math.clamp
v20 = os.clock
v21 = math.noise
_ = math.max
_2 = math.min
v22 = coroutine.wrap
v23 = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 41 | Upvalues: v21 (copy), v20 (copy) ]]
	return v21(0.5, v20() * p13, 8878)
end)
v24 = Vector2.new
v25 = Vector3.new
v26 = CFrame.new
v27 = math.min
v28 = CFrame.fromOrientation
v29 = v26(0, 0, 0)
v30 = RaycastParams.new()
v30.FilterDescendantsInstances = { workspace.Const.Ignore }
v30.FilterType = Enum.RaycastFilterType.Exclude
v31 = Enum.MouseBehavior.LockCenter
v32 = Enum.MouseBehavior.Default
v33 = nil
v34 = nil
v35 = nil
v36 = v24()
v37 = 1
v38 = 0.5
v39 = 70
v40 = v39
v41 = v24()
v42 = 1
v43 = false
v44 = Vector3.new(0, 0, 0)
v45 = Vector3.new(0, 0, 0)
v46 = v26(0, 0, 0)
v47 = v26(0, 0, 0)
v13.CFrame = v47
v48 = v26(0, 0, 0)
v49 = Vector3.new(0, 0, 0)
v50 = 0
v51 = v26(0, -2.4, -1)
v52 = v26(0, 0, 0)
v53 = nil
v54 = nil
v55 = v28(0, 0, 0)
v56 = v28(0, 0, 0)
v57 = v26(0, 0, 0)
v58 = v26(0, -0.1, 0) * v28(-0.2, 0, 0)
v59 = v26(0, -0.05, 0) * v28(-0.15, 0, 0)
v60 = v26(0, 0, 0)
v61 = v26(0, 0, 0)
v62 = v20()
v63 = 0.5
v64 = 0.5
v65 = nil
v66 = false
v67 = 0
v68 = 0
v69 = 0
v70 = false
v71 = 0
v72 = nil
v73 = v25()
v74 = nil
v75 = nil
v76 = nil
v77 = 0
v78 = nil
v1.init = LPH_NO_VIRTUALIZE(function() --[[ Line: 120 | Upvalues: v33 (ref), v3 (copy), v34 (ref), v35 (ref), v9 (copy), v78 (ref), v10 (copy), v41 (ref), v24 (copy), v13 (copy) ]]
	v33 = v3.GetFPSFrame().ScopeUIs
	v34 = v33:GetChildren()
	v35 = v3.GetFPSFrame().Flashbang
	v9:BindToRenderStep("Camera", Enum.RenderPriority.Camera.Value, v78)
	v10.InputChanged:Connect(function(p13, p23) --[[ Line: 128 | Upvalues: v41 (ref), v24 (ref) ]]
		if p13.UserInputType ~= Enum.UserInputType.Gamepad1 or p13.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			return
		end

		if p13.Position.Magnitude > 0.3 then
			v41 = v24(p13.Position.X, -p13.Position.Y)

			return
		end

		v41 = v24(0, 0)
	end)
	v13.CameraType = Enum.CameraType.Scriptable
end)
v79 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 142 | Upvalues: v19 (copy) ]]
	return v19(1 - (1 - p13) ^ p23, 0, 1)
end)
v80 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 146 ]]
	local sum2 = p13 - p23

	if sum2 > math.pi then
		sum2 = sum2 - 6.283185307179586
	end

	if sum2 < -3.141592653589793 then
		sum2 = sum2 + 6.283185307179586
	end

	return sum2
end)
v81 = LPH_NO_VIRTUALIZE(function(p13, p23, p33) --[[ Line: 157 | Upvalues: v80 (copy) ]]
	local v1 = p13 % 6.283185307179586
	local v2 = p23 % 6.283185307179586
	local v3 = v80(v2, v1)

	if p33 <= v3 then
		return v2 - p33
	end

	if v3 <= -p33 then
		return v2 + p33
	end

	return v1
end)
v82 = 0
v83 = 0
v78 = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 173 | Upvalues: v82 (ref), v27 (copy), v69 (ref), v50 (ref), v3 (copy), v35 (ref), v68 (ref), v72 (ref), v73 (ref), v10 (copy), v31 (copy), v83 (ref), v32 (copy), v65 (ref), v41 (ref), v42 (ref), v19 (copy), v46 (ref), v30 (copy), v8 (copy), v6 (copy), v13 (copy), v40 (ref), v79 (copy), v54 (ref), v36 (ref), v24 (copy), v7 (copy), v39 (ref), v43 (ref), v49 (ref), v45 (ref), v25 (copy), v66 (ref), v76 (ref), v74 (ref), v75 (ref), v81 (copy), v77 (ref), v44 (ref), v26 (copy), v28 (copy), v67 (ref), v48 (ref), v21 (copy), v20 (copy), v29 (copy), v47 (ref), v14 (copy), v55 (ref), v17 (copy), v70 (ref), v53 (ref), v52 (ref), v51 (ref), v60 (ref), v61 (ref), v63 (ref), v62 (ref), v64 (ref), v56 (ref), v18 (copy), v5 (copy), v57 (ref), v58 (copy), v59 (copy), v4 (copy), v11 (copy), v16 (copy) ]]
	local v1 = v27(v82, p13)

	v82 = p13
	v69 = v69 + v1 * v50

	local v2 = v1 * 60
	local v33 = v3.GetShouldMouseLock()
	local v410 = Vector3.new(0, 0, 0)

	v35.BackgroundTransparency = v68

	if v68 < 1 then
		v68 = v68 + v1
	end

	if v33 then
		if v72 then
			v410 = v72.Position - v73
			v73 = v72.Position
		end

		v10.MouseBehavior = v31
		v10.MouseIconEnabled = false
		v83 = v83 + v1
	else
		v10.MouseBehavior = v32
		v10.MouseIconEnabled = true
		v83 = 0
	end

	if not v65 then
		return
	end

	v42 = if v41.Magnitude > 0.75 then v19(v42 + v1 * 15, 1, 5) else 1

	local v510 = workspace:Raycast(v46.Position, v46.LookVector * 75, v30)

	if v510 then
		local v610 = v8.GetEntityFromPart(v510.Instance)

		if v610 and v610:Inherits(v6) then
			v42 = 1
		end
	end

	local v78 = v13

	v78.FieldOfView = v78.FieldOfView + (v40 - v13.FieldOfView) * v79(v54 or 0.1, v2)
	v36 = if v33 and not (v83 < 0.05) then if v7.InputDevice == "Mobile" then v410 / 50 * (v40 / v39) else (v10:GetMouseDelta() / 120 + v41 * v42 * v1) * (v13.FieldOfView / v39) else v24(0, 0)

	if v43 then
		v49 = v25(v19(v49.X - v36.Y, -1.75 - v45.X, 1.75 - v45.X), v19(v49.Y - v36.X, -1.5, 1.5), v49.Z)
	else
		if not v66 then
			v49 = v49:Lerp(Vector3.new(0, 0, 0), v79(0.2, v2))
		end

		if v76 then
			local _, v84, _22 = v65.CFrame:ToOrientation()

			v45 = v25(v19(v45.X - v36.Y, v74 or -1.5, v75 or 1.5), v81(v45.Y - v36.X + v77, v84, v76), v45.Z)
		else
			v45 = v25(v19(v45.X - v36.Y, v74 or -1.5, v75 or 1.5), v45.Y - v36.X + v77, v45.Z)
		end
	end

	if v66 then
		v46 = v65.CFrame
	else
		v44 = v65.Position + Vector3.new(0, 1.3, 0)
		v46 = v26(v44) * v28(v45.X, v45.Y, v45.Z)
	end

	if v67 > 0 then
		v48 = v26(v21(0.5, v20() * v67 * 20, 32) * v67 * 4, v21(0.5, v20() * v67 * 20, 89) * v67 * 4, 0)
		v67 = v67 - v1 * 0.8
	else
		v48 = v29
	end

	v77 = 0
	v47 = v46 * v48 * v28(v49.X, v49.Y, v49.Z)
	v13.CFrame = v47
	v14.Position = v46.Position
	v14.CFrame = v14.CFrame:Lerp(v46, v79(0.5, v2))
	v55 = v55:Lerp(v28(v19(-v36.Y / 4, -0.4, 0.4), v19(-v36.X / 4, -0.4, 0.4), 0), v79(0.1, v2))

	local v9 = v17(v69 * 5) * 0.075 * v50
	local v102 = if v70 then v17(v20() * 1.2) * 0.04 else 0

	if v53 then
		v9 = v9 / 10
		v102 = 0
		v52 = v52:Lerp(v51:Inverse() * v53, v79(v54 or 0.2, v2))
	else
		v52 = v52:Lerp(v29, v79(0.1, v2))
	end

	v60 = v60:Lerp(v61, v79(v63, v2))

	if v62 <= v20() then
		v63 = v64
		v61 = v29
	end

	v56 = v56:Lerp(v26(v9, v18(v9 / 2) + v102, 0), v79(0.2, v2))
	v57 = if v5.IsGrounded() then if v5.IsSprinting() and not v53 then v57:Lerp(v59, v79(0.2, v2)) else v57:Lerp(v29, v79(0.2, v2)) else v57:Lerp(v58, v79(0.2, v2))

	local v112 = v51 * v55 * v56 * v52 * v57

	v4.ViewModel:PivotTo(v46 * v48 * v112 * (v112:Inverse() * v60 * v112))
	v11.WaterTransparency = v19((v44.Y - v16) * 0.25, 0.02, 0.25)
	v3.UpdateMap(v1)
end)
v1.SetBaseFOV = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 312 | Upvalues: v39 (ref), v40 (ref), v51 (ref), v26 (copy) ]]
	if p13 < 70 or p13 > 90 then
		error("invalid fov")
	end

	v39 = p13
	v40 = p13
	v51 = v26(0, -2.4 - (p13 - 70) * 0.01, (p13 - 70) * 0.02 + -1)
end)
v1.ScrollY = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 324 | Upvalues: v77 (ref) ]]
	v77 = v77 + p13
end)
v1.SetMaxRelativeLookExtentsY = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 328 | Upvalues: v76 (ref) ]]
	v76 = p13
end)
v1.SetMaxLookExtents = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 332 | Upvalues: v74 (ref), v75 (ref) ]]
	v74 = p13
	v75 = p23
end)
v1.FreeLook = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 337 | Upvalues: v43 (ref) ]]
	v43 = p13
end)
v1.SetZoom = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 341 | Upvalues: v37 (ref), v40 (ref), v39 (ref) ]]
	v37 = p13
	v40 = v39 / p13
end)
v1.IsZoomFinished = LPH_NO_VIRTUALIZE(function() --[[ Line: 346 | Upvalues: v40 (ref), v13 (copy), v18 (copy) ]]
	return v18(v40 - v13.FieldOfView) < 1
end)
v1.GetMouseDelta = LPH_NO_VIRTUALIZE(function() --[[ Line: 350 | Upvalues: v43 (ref), v24 (copy), v36 (ref) ]]
	if v43 then
		return v24()
	end

	return v36
end)
v1.SetMouseSensitivity = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 358 | Upvalues: v38 (ref) ]]
	v38 = p13
end)
v1.SetVMAimingOffset = LPH_NO_VIRTUALIZE(function(p13, p23, p33) --[[ Line: 362 | Upvalues: v34 (ref), v15 (copy), v12 (copy), v6 (copy), v33 (ref), v53 (ref), v54 (ref) ]]
	for v1, v2 in v34 do
		v2.Visible = false
	end

	v15.Parent = v12

	if p13 then
		if p33 == "Infrared" then
			v6.SetInfraredEnabled(true)
		end

		if p33 then
			v33[p33].Visible = true
			v15.Parent = nil
		end
	else
		v6.SetInfraredEnabled(false)
	end

	v53 = p13
	v54 = p23
end)
v1.SetVMInactiveState = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 383 ]] end)
v1.GetCFrame = LPH_NO_VIRTUALIZE(function() --[[ Line: 387 | Upvalues: v46 (ref) ]]
	return v46
end)
v1.GetSubject = LPH_NO_VIRTUALIZE(function() --[[ Line: 391 | Upvalues: v47 (ref) ]]
	return v47
end)
v1.SetSubject = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 395 | Upvalues: v66 (ref), v65 (ref) ]]
	v66 = p23
	v65 = p13
end)
v1.Recoil = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 400 | Upvalues: v61 (ref), v26 (copy), v23 (copy), v28 (copy), v62 (ref), v20 (copy), v63 (ref), v64 (ref), v22 (copy), v7 (copy), v18 (copy), v27 (copy), v45 (ref), v25 (copy), v9 (copy) ]]
	v61 = v26(0, 0, p13.push)

	if p13.rotMag then
		v61 = v61 * v28(0, 0, v23(p13.rotSpeed) * p13.rotMag)
	end

	v62 = v20() + p13.returnTime
	v63 = p13.lerp
	v64 = p13.returnLerp or v63

	if not p13.cameraY then
		return
	end

	v22(function(p13, p23) --[[ Line: 411 | Upvalues: v7 (ref), v20 (ref), v18 (ref), v27 (ref), v45 (ref), v25 (ref), v9 (ref) ]]
		if v7.InputDevice == "Mobile" then
			return
		end

		local v1 = v20() - 1 / 60
		local v2 = v18(p13) * 2
		local v3 = v18(p23) * 2

		while p23 > 0 or (p13 > 0.01 or p13 < -0.01) do
			local v5 = v20() - v1

			if p23 > 0 then
				local v6 = v27(v5 * v3, p23)

				v45 = v45 + v25(v6, 0, 0)
				p23 = p23 - v6
			end

			if p13 > 0.01 or p13 < -0.01 then
				local v4

				v4 = if p13 <= 0 then -v27(v5 * v2, -p13) else v27(v5 * v2, p13)
				v45 = v45 + v25(0, v4, 0)
				p13 = p13 - v4
			end

			v9.RenderStepped:Wait()
		end
	end)(v23(p13.cameraXShake) * p13.cameraX, p13.cameraY)
end)
v1.Shake = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 448 | Upvalues: v67 (ref), v27 (copy) ]]
	v67 = v67 + p13
	v67 = v27(v67, 1)
end)
v1.Flash = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 453 | Upvalues: v68 (ref) ]]
	local v1 = -p13 + 1

	if not (v1 < v68) then
		return
	end

	v68 = v1
end)
v1.SetSwaySpeed = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 460 | Upvalues: v50 (ref), v70 (ref) ]]
	v50 = p13
	v70 = p13 == 0
end)
v1.GetX = LPH_NO_VIRTUALIZE(function() --[[ Line: 470 | Upvalues: v46 (ref) ]]
	local v1, _, _22 = v46:ToOrientation()

	return v1
end)
v1.GetY = LPH_NO_VIRTUALIZE(function() --[[ Line: 475 | Upvalues: v46 (ref) ]]
	local _, v1, _22 = v46:ToOrientation()

	return v1
end)
v84 = LPH_NO_VIRTUALIZE(function(p13) --[[ Line: 480 ]]
	local ViewportSize = workspace.CurrentCamera.ViewportSize

	if p13.X / ViewportSize.X < 0.33 and p13.Y / ViewportSize.Y > 0.25 then
		return true
	end
end)
v85 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 490 | Upvalues: v71 (ref), v72 (ref) ]]
	v71 = v71 - 1

	if v72 ~= p13 then
		return
	end

	v72 = nil
end)
v86 = LPH_NO_VIRTUALIZE(function(p13, p23) --[[ Line: 498 | Upvalues: v71 (ref), v10 (copy), v31 (copy), v84 (copy), v72 (ref), v73 (ref) ]]
	v71 = v71 + 1

	if v10.MouseBehavior ~= v31 or v84(p13.Position) then
		return
	end

	v72 = p13
	v73 = p13.Position
end)
v10.TouchEnded:Connect(v85)
v10.TouchStarted:Connect(v86)

return true
