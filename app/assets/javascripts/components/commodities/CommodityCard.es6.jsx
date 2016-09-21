import React, {Component} from 'react'

class CommodityCard extends Component{
  constructor(props){
    super(props);
    this.state = {
      commodity:  this.props.commodity,
      shop_owner: this.props.shop_owner
    }
  }

  render(){
    var picked = "available";
    if(this.props.commodity.picked) {
      var picked = "picked";
    }

    return(
      <div className="commodity-card col-md-6">
        <div id="container">
          <nav>
            <ul>
              <li className={picked}>
                <a href="#">{picked}</a>
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
