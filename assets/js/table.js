function Table(args)
{
    if (!args) args = new Array();
    this._id = args['id'];

    var options = 
    { 
      headers:
      { 
	0: { 
	    sorter: false
	},
	4: {
	    sorter: false
	}
      } 
    }

    $('#' + args['id']).tablesorter(options);
}

Table.prototype.sort = function()
{
    $("#" + this._id).tablesorter({ sortList:[[2,0],[1,0]] })
}

Table.prototype.add_row_from = function(response)
{ 
    $('#' + this._id + ' tr:last').after(response['row']);
}

Table.prototype.remove_row = function(row_id) {
    $('#' + this._id).find('#' + row_id).remove();
}
