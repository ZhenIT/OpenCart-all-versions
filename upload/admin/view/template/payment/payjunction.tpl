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
    <select name="payjunction_status">
      <?php if ($payjunction_status) { ?>
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
    <select name="payjunction_geo_zone_id">
      <option value="0"><?php echo $text_all_zones; ?></option>
      <?php foreach ($geo_zones as $geo_zone) { ?>
      <?php if ($geo_zone['geo_zone_id'] == $payjunction_geo_zone_id) { ?>
      <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
    <br />
    <br />
    <?php echo $entry_order_status; ?><br />
    <select name="payjunction_order_status_id">
      <?php foreach ($order_statuses as $order_status) { ?>
      <?php if ($order_status['order_status_id'] == $payjunction_order_status_id) { ?>
      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
      <?php } else { ?>
      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
      <?php } ?>
      <?php } ?>
    </select>
    <br />
    <br />
    <?php echo $entry_username; ?><br />
    <input type="text" name="payjunction_username" value="<?php echo $payjunction_username; ?>" />
    <br />
    <?php if ($error_username) { ?>
    <span class="error"><?php echo $error_username; ?></span>
    <?php } ?>
    <br />
    <?php echo $entry_password; ?><br />
    <input type="text" name="payjunction_password" value="<?php echo $payjunction_password; ?>" />
    <br />
    <?php if ($error_password) { ?>
    <span class="error"><?php echo $error_password; ?></span>
    <?php } ?>
    <br />
    <?php echo $entry_test; ?><br />
    <?php if ($payjunction_test) { ?>
    <input type="radio" name="payjunction_test" value="1" checked="checked" />
    <?php echo $text_yes; ?>
    <input type="radio" name="payjunction_test" value="0" />
    <?php echo $text_no; ?>
    <?php } else { ?>
    <input type="radio" name="payjunction_test" value="1" />
    <?php echo $text_yes; ?>
    <input type="radio" name="payjunction_test" value="0" checked="checked" />
    <?php echo $text_no; ?>
    <?php } ?>
    <br />
    <br />
    <?php echo $entry_sort_order; ?><br />
    <input type="text" name="payjunction_sort_order" value="<?php echo $payjunction_sort_order; ?>" size="1" />
  </div>
</form>
<script type="text/javascript"><!--
$.tabs('.tabs a'); 
//--></script>
