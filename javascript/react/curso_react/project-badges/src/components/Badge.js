import React from "react";
import confLogo from "../images/badge-header.svg";
import "./styles/Badge.css";

class Badge extends React.Component {
  render() {



    return (
      <div className="Badge">
        <div className="Badge_header">
          <img src={confLogo} alt="Logo de la conferencia" />
        </div>
        <div className="Badge_section-name">
          <img className="Badge_avatar" src={this.props.avatarUrl} alt="Avatar" />
          <h1>
            {this.props.firstName} <br /> {this.props.lastName}
          </h1>
        </div>
        <div className="Badge_section-info">
          <h3> {this.props.jobTitle}</h3>
          <div> @{this.props.socialMedia}</div>
        </div>
        <div className="Badge_footer">#fleetingConf</div>
      </div>
    );
  }
}

export default Badge;
