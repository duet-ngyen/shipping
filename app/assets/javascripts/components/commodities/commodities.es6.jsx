import React, {Component} from 'react';
import CommodityCard from 'components/commodities/CommodityCard.es6.jsx'

class Commodities extends Component {
    constructor(props){
        super(props);
        this.state = {
            commodities: [],
            users: [],
            didFetchData: false
        };
    }

    componentDidMount(){
        $.ajax({
            url: "/commodities",
            dataType: "json",
            error: function (xhr, status, error) {
                console.log('AJAX Error: ' + status + error);
            },
            success: function (respone) {
                this.setState({commodities: respone["commodities"]});
                this.setState({users: respone["users"]});
                this.setState({didFetchData: true});
            }.bind(this)
        });
    }

    render() {
        if(this.state.users.length > 0 && this.state.commodities.length > 0){
            var cardsCommodity = this.state.commodities.map((commodity) => {
                return <CommodityCard key={commodity.id}
                                      shop_owner={find_user_by_id(this.state.users, commodity.shop_owner_id)}
                                      commodity={commodity}></CommodityCard>
            });
        } else if(this.state.didFetchData){
            var cardsCommodity = <div>
                No data
            </div>

        }

        return (
            <div className="ui stackable two column grid">
                {cardsCommodity}
            </div>
        );
    }
}

export default Commodities;