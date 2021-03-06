<li id="cart">

    <a href="#">
        <div id="cart-total" class="uk-button uk-button-secondary uk-button-medium"><?php echo $text_items; ?></div>
    </a>

    <ul class="uk-navbar-dropdown uk-width-large">
      <?php if ($products || $vouchers) { ?>
      <li>
        <table class="uk-table uk-table-divider uk-table-striped">
          <?php foreach ($products as $product) { ?>
          <tr>
            <td><?php if ($product['thumb']) { ?>
              <a href="<?php echo $product['href']; ?>" style="width:40px;display:block;">
                  <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" style="width:40px;" />
              </a>
              <?php } ?></td>
            <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo mb_substr($product['name'] , 0 , 20); ?><?php echo mb_strlen($product['name'])>20 ? " ..":""; ?></a>
              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php } ?>
              <?php if ($product['recurring']) { ?>
              <br />
              - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
              <?php } ?></td>
            <td>x <?php echo $product['quantity']; ?></td>
            <td><?php echo $product['total']; ?></td>
            <td>
                <button type="button" uk-icon="icon: close" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" ></button>
            </td>
          </tr>
          <?php } ?>
          <?php foreach ($vouchers as $voucher) { ?>
          <tr>
            <td></td>
            <td><?php echo $voucher['description']; ?></td>
            <td>x&nbsp;1</td>
            <td><?php echo $voucher['amount']; ?></td>
            <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
          </tr>
          <?php } ?>
        </table>
      </li>
      <li>
          <table class="uk-table uk-table-divider">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td><strong><?php echo $total['title']; ?></strong></td>
              <td><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
          <p><a href="<?php echo $cart; ?>"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
      </li>
      <?php } else { ?>
      <li>
        <p class="text-center"><?php echo $text_empty; ?></p>
      </li>
      <?php } ?>
    </ul>

</li>
