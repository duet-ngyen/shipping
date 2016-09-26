import React, {Component} from 'react';
import ReactPaginate from 'react-paginate';
import CommodityCard from 'components/commodities/CommodityCard.es6.jsx';

window.React = React;

class Commodities extends Component {
    constructor(props){
        super(props);
        this.state = {
            commodities: [],
            users: [],
            current_user: [],
            bids:[],
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
            success: function (response) {
                this.setState({commodities: response["commodities"]});
                this.setState({users: response["users"]});
                this.setState({current_user: response["current_user"]});
                this.setState({bids: response["bids"]});
                this.setState({didFetchData: true});
            }.bind(this)
        });
    }

    handleOnTagClick(tag_value){
      $.ajax({
        url: "/commodities",
        dataType: "json",
        data: {tag: tag_value},
        error: function (xhr, status, error) {
          console.log('AJAX Error: ' + status + error);
        },
        success: function (response) {
          this.setState({commodities: response["commodities"]});
          this.setState({users: response["users"]});
          this.setState({current_user: response["current_user"]});
          this.setState({bids: response["bids"]});
          this.setState({didFetchData: true});
        }.bind(this)
      });
    }

  handleResetFilter(e){
    $.ajax({
      url: "/commodities",
      dataType: "json",
      data: {tag: ""},
      error: function (xhr, status, error) {
        console.log('AJAX Error: ' + status + error);
      },
      success: function (response) {
        this.setState({commodities: response["commodities"]});
        this.setState({users: response["users"]});
        this.setState({current_user: response["current_user"]});
        this.setState({bids: response["bids"]});
        this.setState({didFetchData: true});
      }.bind(this)
    });
    $('html,body').scrollTop(0);
    e.preventDefault();
  }

    render() {
        if(this.state.users.length > 0 && this.state.commodities.length > 0 && this.state.didFetchData){
            var cardsCommodity = this.state.commodities.map((commodity) => {
                return <CommodityCard key={commodity.id}
                                      shop_owner={find_user_by_id(this.state.users, commodity.shop_owner_id)}
                                      commodity={commodity}
                                      current_user={this.state.current_user}
                                      bids={this.state.bids}
                                      onTagClick={this.handleOnTagClick.bind(this)}></CommodityCard>
            });
        } else if(this.state.didFetchData){
            var cardsCommodity = <div>
                No data
            </div>

        }

        return (
            <div id="commodity-index" className="col-xs-12">
                <div className="clear-filter pull-right">
                  <a href="#" onClick={this.handleResetFilter.bind(this)}><i className="fa fa-eraser" aria-hidden="true"></i> Clear filter</a>
                </div>
                {cardsCommodity}
            </div>
        );
    }
}

export default Commodities;