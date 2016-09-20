function find_user_by_id(users_array, id){
    var user;
    for(var i = 0 ; i< users_array.length; i++){
        var obj = users_array[i];
        if(obj["id"] === id) {
            user = obj;
            return user;
        }
    }

}