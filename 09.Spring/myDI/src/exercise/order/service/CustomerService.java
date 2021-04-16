package exercise.order.service;

import org.springframework.stereotype.Component;

import exercise.order.domain.Customer;

@Component
public interface CustomerService {

	void saveCustomer(Customer customer);

	void deleteCustomer(long id);
}
