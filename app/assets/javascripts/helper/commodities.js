function bided_by_user(bids, current_user){
  for(var i=0; i< bids.length; i++){
    if(bids[i].shipper_id == current_user.id){
      return true;
    }
  }
}

function bids_by_commodity(bids, commodity) {
  results = [];
  for(var i=0; i< bids.length; i++){
    if(bids[i].commodity_id == commodity.id){
      results.push(bids[i])
    }
  }
  return results;
}