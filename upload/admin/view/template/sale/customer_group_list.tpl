<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('view/image/customer.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="location='<?php echo $insert; ?>'" class="button"><span><?php echo $button_insert; ?></span></a><a onclick="$('form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left"><?php if ($sort == 'name') { ?>
              <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
              <?php } ?></td>
            <td class="right"><?php echo $column_action; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($customer_groups) { ?>
          <?php foreach ($customer_groups as $customer_group) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($customer_group['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
              <?php } ?></td>
            <td class="left"><?php echo $customer_group['name']; ?></td>
            <td class="right"><?php foreach ($customer_group['action'] as $action) { ?>
              [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
              <?php } ?></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="3"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </form>
  </div>
</div>
<div class="pagination"><?php echo $pagination; ?></div>
<?php echo $footer; ?>