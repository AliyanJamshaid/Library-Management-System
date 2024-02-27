const express = require('express');
const router = express.Router();
const {getFilteredBooks, getOtherTables} = require('../Controller/Books');


router.route("/books").get(getFilteredBooks);
router.route("/connectedbooks").get(getOtherTables);




module.exports = router;
