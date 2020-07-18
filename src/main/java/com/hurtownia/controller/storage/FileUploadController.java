package com.hurtownia.controller.storage;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hurtownia.model.Product;
import com.hurtownia.service.ProductService;

@Controller
public class FileUploadController {

	@Autowired
	 ProductService productService;
	
	private final StorageService storageService;
	
	@Autowired
	public FileUploadController(StorageService storageService) {
		this.storageService = storageService;
	}

	@GetMapping("/admin/storage")
	public String listUploadedFiles(Model model) throws IOException {

		model.addAttribute("files", storageService.loadAll().map(
				path -> MvcUriComponentsBuilder.fromMethodName(FileUploadController.class,
						"serveFile", path.getFileName().toString()).build().toUri().toString())
				.collect(Collectors.toList()));

		return "uploadFile";
	}

	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {

		Resource file = storageService.loadAsResource(filename);
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=\"" + file.getFilename() + "\"").body(file);
	}

	@PostMapping("/admin/storage/upload_img/{id}")
	public String handleFileUpload(@RequestParam("file") MultipartFile file,@PathVariable long id, RedirectAttributes redirectAttributes) {
		
		String filename = StringUtils.cleanPath(file.getOriginalFilename());
		int nameLength = filename.length();		
		LocalDateTime myDateObj = LocalDateTime.now();
		filename = filename.substring(0, nameLength-5)+myDateObj.getYear()+myDateObj.getMonthValue()+myDateObj.getDayOfMonth()+filename.substring(nameLength-5);
		
		storageService.store(file);
		redirectAttributes.addFlashAttribute("file_name",filename);
		
		Product product = productService.getProductById(id);
		
		product.setImgurlbig("/resources/product_img/"+filename);
		product.setImgurlsmall("/resources/product_img/"+filename);
		productService.saveOrUpdate(product);
		
		return "redirect:/admin";
	}

	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

}
