package com.lcb404.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lcb404.command.MissingBoardVO;
import com.lcb404.service.MissingBoardService;
import com.lcb404.utill.Criteria;
import com.lcb404.utill.PageVO;



@Controller
@RequestMapping("missboard")
public class MissingBoardController {

	@Autowired
	private MissingBoardService missingBoardService;

	
	@RequestMapping("/MissingList")
	public String MissingList(Criteria cri,Model model) {
		
		model.addAttribute("MissingBoardList",missingBoardService.MissinggetList(cri) );
		int total = missingBoardService.getTotal(cri);		
		PageVO pageVO = new PageVO(cri,total);
		model.addAttribute("pageVO", pageVO);		
		model.addAttribute("cri", cri);
		
		
		
		return "missboard/MissingList";
	}
	
   @ResponseBody
   @RequestMapping("/display")
   public ResponseEntity<byte[]> display(@RequestParam("fileLoca") String fileLoca) {

	  if(fileLoca.equals("none")) {
		  return null;
	  }
	   
	  //파일을 읽을 경로
      File file = new File(fileLoca);
      
      
      //@ResponseEntity는 서버에서 응답에 대한 내용, 메세지, 정보를 보내줄때 사용
      ResponseEntity<byte[]> result = null; 
                
        try { 
           HttpHeaders header = new HttpHeaders();
           header.add("Content-type", Files.probeContentType(file.toPath())); //컨텐트 타입-파일 MINE 타입
           result = new ResponseEntity<byte[]>( FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
           
      
        } catch (IOException e) { 
           e.printStackTrace(); 
        }
        return result;
   }

   @RequestMapping("/MissingRegist")
	public String MissingRegist() {
		return "missboard/MissingRegist";
	}
	
	
   @RequestMapping(value="/regist",method=RequestMethod.POST)
	public String MissingRegist(MissingBoardVO vo,RedirectAttributes RA,MultipartHttpServletRequest files) {

		
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(date);
		String DBLoca;
		
		
		
		try {
		
			String uploadPath = "/var/upload/" + fileLoca;
			
			File folder = new File(uploadPath);
			if(!folder.exists()) {//폴더가 없다면
				folder.mkdir();
			}
			
			List<MultipartFile> list = files.getFiles("file"); //매개변수는 화면에 name값
			
			System.out.println(list.toString());
			
			for(int i = 0; i < list.size(); i++) {
				
								
				String fileRealName = list.get(i).getOriginalFilename(); //파일실제이름
				long size = list.get(i).getSize();
				String fileExtension = fileRealName.substring( fileRealName.lastIndexOf(".") , fileRealName.length() );
				
				UUID uuid = UUID.randomUUID();
				String uuids = uuid.toString().replaceAll("-","");
				
				
				
				DBLoca = uploadPath + "/" + uuids+"uuid" + fileRealName;
				File saveFile = new File(DBLoca);
				
				if(i==0) {
					vo.setLoca1(DBLoca);
				}else if(i==1) {
					vo.setLoca2(DBLoca);
				}else if(i==2) {
					vo.setLoca3(DBLoca);
				}
				
				list.get(i).transferTo(saveFile); //실제 파일을 저장
				
			}
			
		} catch (Exception e) {
			System.out.println("fileupload error" + e.getMessage());
		}
		
		
		
		
		
		int result = missingBoardService.Missingregist(vo);
		
		if(result == 0) {
			RA.addFlashAttribute("msg", "게시글 등록에 실패했습니다");
			
			}else {
			RA.addFlashAttribute("msg", "게시글 등록이 정상 처리되었습니다");						
			}
		
		
		return "redirect:/missboard/MissingList";
	}
	
	
	@RequestMapping("/MissingDetail")
	public String MissingDetail(@RequestParam("found_number")int found_number, Model model) {
		MissingBoardVO vo = missingBoardService.getContent(found_number);
		model.addAttribute("MissingBoardVO", vo);
		
		
		return "missboard/MissingDetail";
	}
	
	
	@RequestMapping("/MissingModify")
	public String MissingModify(MissingBoardVO vo, Model model) {
		model.addAttribute("MissingBoardVO", vo);
		return "missboard/MissingModify";
	}
	
	@RequestMapping("/MissingModifyForm")
	public String ModifyForm(MissingBoardVO vo,RedirectAttributes RA) {
		
		int result = missingBoardService.Update(vo);
		if(result == 0) {
		RA.addFlashAttribute("msg", "게시글 수정이 실패했습니다");
		
		}else {
		RA.addFlashAttribute("msg", "게시글 수정이 정상 처리되었습니다");						
		}
		return "redirect:/missboard/MissingList";
	}
	
	@RequestMapping("/MissingDelete")
	public String MissingDelete(MissingBoardVO vo,RedirectAttributes RA) {
		
		int result = missingBoardService.delete(vo.getFound_number());
		
		if(result==0) {
			RA.addFlashAttribute("msg", "게시글 삭제가 실패했습니다");			
		}else {
			RA.addFlashAttribute("msg", "게시글 삭제가 성공했습니다");
		}
		return "redirect:/missboard/MissingList";
	}	
	
}
