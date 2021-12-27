var express = require("express");
var app = express();
require("dotenv").config();

// set our port
var port = process.env.PORT || 8000; 

// ROUTES FOR OUR API
// =============================================================================
var router = express.Router();

router.get("/", function (req, res) {
  res.status(200).json({ message: "Yeah! welcome to our api!" });
});

router.get("/:id", function (req, res) {
  res.status(200).json({ id: req.params.id });
});

app.use("/api", router);

// START THE SERVER
// =============================================================================
app.listen(port);
console.log("Magic happens on port " + port);
