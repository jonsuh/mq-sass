var mqsass = require("./index");

module.exports = function(eyeglass, sass) {
  return {
    sassDir: mqsass.includePaths[0]
  };
};
