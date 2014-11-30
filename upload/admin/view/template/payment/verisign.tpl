<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="heading">
  <h1><?php echo $heading_title; ?></h1>
  <div class="buttons"><a onclick="$('#form').submit();" class="button"><span class="button_left button_save"></span><span class="button_middle"><?php echo $button_save; ?></span><span class="button_right"></span></a><a onclick="location='<?php echo $cancel; ?>';" class="button"><span class="button_left button_cancel"></span><span class="button_middle"><?php echo $button_cancel; ?></span><span class="button_right"></span></a></div>
</div>
<div class="tabs"><a tab="#tab_general"><?php echo $tab_general; ?></a></div>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
  <div id="tab_general" class="page"><?php echo $entry_status; ?><br />
    <select name="verisign_status">
      <?php if ($verisign_status) { ?>
      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
      <option value="0"><?php echo $text_disabled; ?></option>
      <?php } else { ?>
      <option value="1"><?php echo $text_enabled; ?></option>
      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
      <?php } ?>
    </select>
    <br />
    <br />
    <?php echo $entry_geo_zone; ?><br />
    <select name="verisign_geo_zone_id">
      <option value="0"><?php echo $text_all_zones; ?></option>
      <?php foreach ($geo_zones as $geo_zone) { ?>
      <?php if ($geo_zone['geo_zone_id'] == $verisign_geo_zone_id) { ?>
      <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
    <br />
    <br />
    <?php echo $entry_order_status; ?><br />
    <select name="verisign_order_status_id">
      <?php foreach ($order_statuses as $order_status) { ?>
      <?php if ($order_status['order_status_id'] == $verisign_order_status_id) { ?>
      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
    <br />
    <br />
    <?php echo $entry_merchant; ?><br />
    <input type="text" name="verisign_merchant" value="<?php echo $verisign_merchant; ?>" />
    <br />
    <?php if ($error_merchant) { ?>
    <span class="error"><?php echo $error_merchant; ?></span>
    <?php } ?>
    <br /> 
    <?php echo $entry_partner; ?><br />
    <input type="text" name="verisign_partner" value="<?php echo $verisign_partner; ?>" />
    <br />
    <?php if ($error_partner) { ?>
    <span class="error"><?php echo $error_partner; ?></span>
    <?php } ?>
    <br />
    <?php echo $entry_country; ?><br />
    <select name="verisign_country">
      <?php if ($verisign_country == 'australia') { ?>
      <option value="australia" selected="selected"><?php echo $text_australia; ?></option>
      <?php } else { ?>
      <option value="australia"><?php echo $text_australia; ?></option>
      <?php } ?>
      <?php if ($verisign_country == 'usa') { ?>
      <option value="usa" selected="selected"><?php echo $text_usa; ?></option>
      <?php } else { ?>
      <option value="usa"><?php echo $text_usa; ?></option>
      <?php } ?>
    </select>
    <br />
    <br />
    <?php echo $entry_test; ?><br />
    <?php if ($verisign_test) { ?>
    <input type="radio" name="verisign_test" value="1" checked="checked" />
    <?php echo $text_yes; ?>
    <input type="radio" name="verisign_test" value="0" />
    <?php echo $text_no; ?>
    <?php } else { ?>
    <input type="radio" name="verisign_test" value="1" />
    <?php echo $text_yes; ?>
    <input type="radio" name="verisign_test" value="0" checked="checked" />
    <?php echo $text_no; ?>
    <?php } ?>
    <br />
    <br />
    <?php echo $entry_sort_order; ?><br />
    <input type="text" name="verisign_sort_order" value="<?php echo $verisign_sort_order; ?>" size="1" />
  </div>
</form>
<script type="text/javascript"><!--
$.tabs('.tabs a'); 
//--></script>
