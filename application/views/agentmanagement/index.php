<link rel="stylesheet" type="text/css" media="screen" href="<?php echo base_url() ?>assets/js/jquery-ui.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/css/ui.jqgrid.min.css" />

<script type="text/javascript" src="<?php echo base_url()?>assets/js/jqgrid/js/jquery.min.js" ></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/jqgrid/js/trirand/jquery.jqGrid.min.js" ></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/jqgrid/js/trirand/grid.locale-fr.js" ></script>
<script type="text/javascript" src="<?php echo base_url() ?>assets/js/dialog_form.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>assets/js/jqgrid/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?php echo base_url() ?>assets/js/agentTable.js"></script>




<table id="agentTable"></table>

<div id="agentDialog">
		<?php for($i = 0; $i < count($this->agents); $i++){ ?>
			<input type="checkbox" value="<?php echo $this->agents[$i]->user_id ?>"><?php echo $this->agents[$i]->user_firstName." ".$this->agents[$i]->user_lastName ?></input>
		<?php } ?>
	</select>

</div>