<?php 
class ControllerAccountLogout extends Controller {
	public function index() {
    	if ($this->customer->isLogged()) {
      		$this->customer->logout();
	  		$this->cart->clear();
	  
      		$this->redirect($this->url->https('account/logout'));
    	}
 
    	$this->load->language('account/logout');
		
		$this->document->title = $this->language->get('heading_title');
      	
		$this->document->breadcrumbs = array();

      	$this->document->breadcrumbs[] = array(
        	'href'      => $this->url->http('common/home'),
        	'text'      => $this->language->get('text_home'),
        	'separator' => FALSE
      	);
      	
		$this->document->breadcrumbs[] = array(
        	'href'      => $this->url->http('account/account'),
        	'text'      => $this->language->get('text_account'),
        	'separator' => $this->language->get('text_separator')
      	);
		
      	$this->document->breadcrumbs[] = array(
        	'href'      => $this->url->http('account/logout'),
        	'text'      => $this->language->get('text_logout'),
        	'separator' => $this->language->get('text_separator')
      	);	
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_message'] = $this->language->get('text_message');

    	$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['continue'] = $this->url->http('common/home');

		$this->id       = 'content';
		$this->template = 'common/success.tpl';
		$this->layout   = 'module/layout';
		
		$this->render();	
  	}
}
?>
