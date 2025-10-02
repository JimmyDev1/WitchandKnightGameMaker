
// 1. Input Setup
controlsSetup();


// 2. Movement & Physics
moveDir = 0;      // direction of movement
moveSpd = 7;      // horizontal speed
xspd = 0;         // x velocity
yspd = 0;         // y velocity

// Jump & Gravity
grav     = 0.330;   // gravity strength
termVel  = 12;      // terminal fall velocity
jspd     = -10.15;  // jump speed
dspd     = 2;       // down key adds speed when falling

// 3. Stats
HP = 100;
Armor = 0;



// 4. State Definitions
enum PlayerState {
    MOVE,
    ATTACK
}

enum MoveState {
    IDLE,
    WALK,
    JUMP_RISE,
    JUMP_PEAK,
    JUMP_FALL,
    CROUCH
}

enum AttackState {
    ATTACK_NEUTRAL,
    ATTACK_NEUTRAL_AIR,
    ATTACK_UP_GROUND,
    ATTACK_UP_AIR,
    ATTACK_DOWN_AIR
}


// 5. Initial State Setup
state         = PlayerState.MOVE;
action_state  = MoveState.IDLE;
hitbox_spawned = false;
attack_started = false;

// 6. Debug / Misc
// hitByAttack = ds_list_create(); // (optional if needed)
debug_counter = 0;


// 7. Visuals / Orientation
image_xscale = 4;
image_yscale = 4;
facing       = 1; // 1 = right, -1 = left


check = false;