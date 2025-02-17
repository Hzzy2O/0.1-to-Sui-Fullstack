
//pre lesson
module admin::week_zero {
    //==============================================================================================
    // Dependencies
    //==============================================================================================
    use std::string::{String};
    use sui::event;

    //==============================================================================================
    // Constants
    //==============================================================================================

    //==============================================================================================
    // Error codes
    //==============================================================================================

    //==============================================================================================
    // Structs 
    //==============================================================================================
    public struct Profile has key{
        id: UID,
        name: String,
        description: String,
    }

    //==============================================================================================
    // Event Structs 
    //==============================================================================================
    public struct ProfileCreated has copy, drop {
        id: ID,
        owner: address,
    }

    //==============================================================================================
    // Init
    //==============================================================================================

    //==============================================================================================
    // Entry Functions 
    //==============================================================================================
    public entry fun create_profile(
        name: String, 
        description: String, 
        ctx: &mut TxContext
    ){
        let owner = tx_context::sender(ctx);
        let uid = object::new(ctx);
        let id = object::uid_to_inner(&uid);
        let new_profile = Profile {
            id: uid,
            name,
            description,
        };
        transfer::transfer(new_profile, owner);
        event::emit(ProfileCreated{
            id,
            owner,
        });
    }
    //==============================================================================================
    // Getter Functions 
    //==============================================================================================

    //==============================================================================================
    // Helper Functions 
    //==============================================================================================
}
