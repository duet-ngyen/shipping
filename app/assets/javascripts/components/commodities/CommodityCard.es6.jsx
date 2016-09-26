import React, {Component} from 'react'

class CommodityCard extends Component{
  constructor(props){
    super(props);
    this.state = {
      commodity:  this.props.commodity,
      shop_owner: this.props.shop_owner,
      current_user: this.props.current_user,
      bids: this.props.bids
    }
  }

  handleOnClickTag(e){
    var tag = e.target.text;
    this.props.onTagClick(tag);
    $('html,body').scrollTop(0);
    e.preventDefault();
  }

  render(){
    var picked = "available";
    var bids_commodity = bids_by_commodity(this.state.bids, this.state.commodity);
    var bided_status = bided_by_user(bids_commodity, this.state.current_user);

    if(this.props.commodity.picked) {
      picked = "picked";
    } else if(bided_status){
      picked = "bided";
    } else if(this.state.commodity.shop_owner_id == this.state.current_user.id){
      picked = "yours";
    }

    return(
      <div className="commodity-card col-md-6">
        <div id="container">
          <nav>
            <ul>
              <li className={picked} >
                <a href="#" value={picked} onClick={this.handleOnClickTag.bind(this)}>{picked}</a>
              </li>
            </ul>
            <span>by <a href={Routes.user_path(this.state.commodity.shop_owner_id)}>{this.props.shop_owner.full_name}</a></span>
          </nav>
          <div className="bubble">
            <div className="rectangle">
              <h2><a href={Routes.commodity_path(this.state.commodity.id)}>{this.state.commodity.title}</a></h2>
            </div>
            <div className="triangle-l"></div>
            <div className="triangle-r"></div>
            <div className="info">
              <h2>From: {this.props.commodity.departures}</h2>
              <h2>To: {this.props.commodity.destination}</h2>
              <p>
                Price deposite: {this.props.commodity.price_deposite}<br/>
                Price wage: {this.props.commodity.price_wage}<br/>
              </p>
              <p>
                Contact: {this.props.shop_owner.phone_number}<br/>
              </p>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default CommodityCard
