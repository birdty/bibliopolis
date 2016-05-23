function Table(args)
{
    if (!args) args = new Array();
    this._id = args['id'];
}

Table.prototype.add_row_from = function(response)
{ 
    $('#' + this._id + ' tr:last').after(response['row']);
}

Table.prototype.remove_row = function(row_id) {
    $('#' + this._id).find('#' + row_id).remove();
}
