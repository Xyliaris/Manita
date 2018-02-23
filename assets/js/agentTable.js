$(document).ready(function () {
  href_url = window.location.href;
  
  $("#agentTable").jqGrid({
      url: href_url + '/readTickets',
    datatype: "json",
      colNames:['id',"Titre", "Description", "Salle", "Date de création"],
      colModel:[
        {name:'ticket_id',            index:'ticket_id',            width:55,   template: "integerStr"},
        {name:'ticket_title',         index:'ticket_title',         width:100                          },
        {name:'ticket_description',   index:'ticket_description',   width:100                          },
        {name:'room_label',           index:'room_label',           width:100                          },
        {name:'ticket_creation',      index:'ticket_creation',      width:100                          }

      ],
      rowNum:10,
      rowList:[10,20,30],
      sortname: 'idGroup',
      viewrecords: true,
      sortorder: "asc",
      loadonce: true,
      //autowidth: true,
      //multiSort: true,
      pager : '#gridpager',
      width: "auto",
      height: "auto",
      caption:"Table Gestion Agents",
  });
});
