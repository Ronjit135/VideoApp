package com.app.videoApp.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

@Controller
public class MainController {

	private String moviePath = "D:\\VideoApp\\M";
	private String showPath = "D:\\VideoApp\\S";
	private String currentPath = null;

	private String getMoviePath() {
		if (moviePath != null) {
			return moviePath;
		} else {
			return "No Path Selected";
		}
	}

	private String getShowPath() {
		if (showPath != null) {
			return showPath;
		} else {
			return "No Path Selected";
		}
	}

	private void setMoviePath(String moviePath) {
		this.moviePath = moviePath;
	}

	private void setShowPath(String showPath) {
		this.showPath = showPath;
	}

	@PostConstruct
	private void initData() {
		System.out.println("Started");
	}

	@GetMapping("/")
	public String redirectHome() {
		return "redirect:/Home";
	}

	@GetMapping("/Home")
	public String showHome(ModelMap map) {
		map.addAttribute("currentMoviePath", getMoviePath());
		map.addAttribute("currentShowPath", getShowPath());
		return "HomePage";
	}

	@PostMapping("/AddMoviePath")
	public @ResponseBody String addMoviePath(@RequestParam(name = "moviePath") String moviePath) {
		setMoviePath(moviePath);
		return getMoviePath();
	}

	@PostMapping("/AddShowPath")
	public @ResponseBody String addShowPath(@RequestParam(name = "showPath") String showPath) {
		setShowPath(showPath);
		return getShowPath();
	}

	@GetMapping("/Movie")
	public String showMovie(ModelMap map) {
		final String moviePath = getMoviePath();
		File movieFolder = new File(moviePath);
		if (!movieFolder.exists())
			movieFolder.mkdirs();
		File[] rootFiles = movieFolder.listFiles();
		List<File> fileList = new ArrayList<>();
		for (File file : rootFiles) {
			fileList.add(file);
		}
		map.addAttribute(fileList);
		return "Movie";
	}

	@PostMapping("/SelectDirectory")
	public @ResponseBody List<String> selectDirectory(@RequestParam(name = "directory") String directory) {
		currentPath = getMoviePath();
		currentPath += File.separator + directory;

		File current = new File(currentPath);
		File[] files = current.listFiles();
		List<String> fileList = new ArrayList<>();

		for (File file : files) {
			fileList.add(file.getName());
		}

		return fileList;
	}

	@Async
	@GetMapping("/Movie/Preview")
	public @ResponseBody String streamMovie(@RequestParam(name = "movieName") String movieName,
			HttpServletResponse response) {
		System.out.println(movieName);
		String rootPath = currentPath;
		File file = new File(rootPath + File.separator + movieName);
		try {
			InputStream is = new FileInputStream(file);
			response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
			response.setHeader("Content-Length", String.valueOf(file.length()));
			try {
				IOUtils.copy(is, response.getOutputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("Success : " + movieName);
			return "" + response;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Async
	@GetMapping("/Load")
	public @ResponseBody StreamingResponseBody showMovie(@RequestParam(name = "movieName") String movieName,
			HttpServletResponse response) {
		String rootPath = currentPath;
		File file = new File(rootPath + File.separator + movieName);
		try {
			byte[] content = Files.readAllBytes(file.toPath());
			return new StreamingResponseBody() {
				@Override
				public void writeTo(OutputStream outputStream) throws IOException {
					outputStream.write(content);
					outputStream.flush();
				}
			};
		} catch (IOException e) {
			System.out.println(" IO Exception : " + e.getMessage());
			return null;
		}
	}

	@Async
	@GetMapping("/Loading")
	public @ResponseBody StreamingResponseBody showLoading() {
		String rootPath = getMoviePath();
		File file = new File(rootPath);
		File parent = new File(file.getParent() + File.separator + "Loading.mp4");
		try {
			byte[] content = Files.readAllBytes(parent.toPath());
			return new StreamingResponseBody() {
				@Override
				public void writeTo(OutputStream outputStream) throws IOException {
					outputStream.write(content);
					outputStream.flush();
				}
			};
		} catch (IOException e) {
			System.out.println(" IO Exception : " + e.getMessage());
			return null;
		}
	}

	@GetMapping("/Show")
	public String showShow() {
		return "Show";
	}

	@GetMapping("/Upload")
	public String showUpload(ModelMap map) {
		return "Upload";
	}

	@PostMapping("/Upload")
	public String AddMovie(ModelMap map, Long genreId, String movieName, MultipartFile file) {
		if (!file.isEmpty()) {
			try {
				byte[] fileContent = file.getBytes();
				String rootPath = "D:\\OneDrive\\OneDrive - Sapiens\\Workspaces\\VideoApp\\Movies";
				File dir = new File(rootPath);
				if (!dir.exists())
					dir.mkdirs();
				File movie = new File(dir.getAbsolutePath() + File.separator + movieName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(movie));
				stream.write(fileContent);
				stream.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return "Upload";
	}
}
