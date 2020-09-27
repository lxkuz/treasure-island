// Support component names relative to this directory:
/* eslint-disable no-undef */
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
/* eslint-enable no-undef */

ReactRailsUJS.useContext(componentRequireContext);
