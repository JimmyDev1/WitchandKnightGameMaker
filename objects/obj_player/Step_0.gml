// ─────────────────────────────────────
// 1. Input Handling
// ─────────────────────────────────────
getControls(); // update leftKey, rightKey, jumpKey, etc.

// ─────────────────────────────────────
// 2. Movement Input and Direction
// ─────────────────────────────────────
moveDir = rightKey - leftKey; // -1 (left), 0 (idle), 1 (right)
xspd = moveDir * moveSpd;

if (moveDir != 0) {
    facing = moveDir;
}

image_xscale = 4 * facing; // flip sprite based on direction

// ─────────────────────────────────────
// 3. X-Axis Collision and Movement
// ─────────────────────────────────────
var _subPixel = 0.5;

if (place_meeting(x + xspd, y, obj_ground)) {
    var _pixelCheck = _subPixel * sign(xspd);
    while (!place_meeting(x + _pixelCheck, y, obj_ground)) {
        x += _pixelCheck;
    }
    xspd = 0;
}

x += xspd;

// ─────────────────────────────────────
// 4. Gravity and Down Key Fall Boost
// ─────────────────────────────────────
yspd += grav;

if (yspd > termVel) {
    yspd = termVel;
}


if (downKey && yspd > -4.50 ) {

    yspd += dspd;
	
} 

// ─────────────────────────────────────
// 5. Jumping (Buffered Input)
// ─────────────────────────────────────
if (jumpKeyBuffered && place_meeting(x, y + 1, obj_ground)) {
    jumpKeyBuffered = false;
    jumpKeyBufferTimer = 0;
    yspd = jspd;
}

// ─────────────────────────────────────
// 6. Y-Axis Collision and Movement
// ─────────────────────────────────────
_subPixel = 0.5;

if (place_meeting(x, y + yspd, obj_ground)) {
    var _pixelCheck = _subPixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, obj_ground)) {
        y += _pixelCheck;
    }
    yspd = 0;
}
y += yspd;

// ─────────────────────────────────────
// 7. State Machine Execution
// ─────────────────────────────────────
switch (state) {
    case PlayerState.MOVE:
        PlayerState_Move(); // calls your move state manager
        break;

    case PlayerState.ATTACK:
        PlayerState_Attack(); // calls your attack state manager
        break;
}

