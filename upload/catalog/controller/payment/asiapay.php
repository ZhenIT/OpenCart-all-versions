<?php
class ControllerPaymentAsiaPay extends Controller {
	protected function index() {
		
		
		
		$this->id       = 'payment';
		$this->template = 'payment/asiapay.tpl';
		
		$this->render();
	} 	
}
?>