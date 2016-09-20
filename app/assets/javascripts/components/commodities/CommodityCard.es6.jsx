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
        return(
            <div className="col-sm-4 col-xs-12">
                <div className="comodity-card">
                    <h6><a href={Routes.commodity_path(this.state.commodity.id)}>{this.state.commodity.title}</a></h6>
                    Posted by: <a href={Routes.user_path(this.state.commodity.shop_owner_id)}>{this.props.shop_owner.full_name}</a><br/>
                    From: {this.props.commodity.departures}<br/>
                    To: {this.props.commodity.destination}<br/>
                    Price deposite: {this.props.commodity.price_deposite}<br/>
                    Price wage: {this.props.commodity.price_wage}<br/>
                    Contact: {this.props.shop_owner.phone_number}<br/>
                </div>
            </div>
        );
    }
}

export default CommodityCard
