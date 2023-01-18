package com.beatphobia.mkroom.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;
import com.beatphobia.mkroom.common.paging.QnaPagingCreatorDTO;
import com.beatphobia.mkroom.common.paging.QnaPagingDTO;
import com.beatphobia.mkroom.domain.member.Member;
import com.beatphobia.mkroom.domain.qna.FaqDTO;
import com.beatphobia.mkroom.domain.qna.QnaDTO;
import com.beatphobia.mkroom.service.qna.FaqService;
import com.beatphobia.mkroom.service.qna.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@AllArgsConstructor
@Controller
@Log4j
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	private QnaService qnaService;
	private FaqService faqService;
	
	@GetMapping("/qnalist")
	public void showQnaList(QnaPagingDTO qnaPagingDTO, Model model) {
		
		model.addAttribute("qnaList", qnaService.getQnaList(qnaPagingDTO));
		model.addAttribute("faqList", faqService.getFaqList());
		
		long rowAmountTotal = qnaService.getRowAmountTotal(qnaPagingDTO);

		QnaPagingCreatorDTO qnaPagingCreatorDTO = 
				new QnaPagingCreatorDTO(rowAmountTotal, qnaPagingDTO);
		model.addAttribute("pagingCreator", qnaPagingCreatorDTO);
		
	}

	@PreAuthorize("(isAuthenticated() && principal.username == #member.userId)")
	@GetMapping("/qnaregister")
	public void showQnaRegisterPage(Member member) {
		
	}

	@PostMapping("/qnaregister")
	@Transactional
	public String registerNewQna(QnaDTO qnaDTO, RedirectAttributes redirectAttr) {
		
		long bno = qnaService.getLastBno() + 1 ;
		qnaDTO.setBno(bno);
		
		qnaService.registerQna(qnaDTO) ;
		
		List<FileInfoDTO> fileInfos = qnaDTO.getAttachFileList();

		System.out.println(">>>>.11111111: " + fileInfos);
		
		if (fileInfos != null) {
			fileInfos.forEach(
					fileInfo -> qnaService.registerAttachFile(fileInfo, qnaDTO)
			);
		}
		
		redirectAttr.addFlashAttribute("result", bno);

		return "redirect:/qna/qnalist";
	}
	
	@GetMapping("/qnadetail")
	public void showBoardDetail(Long bno, String loginUserName, @ModelAttribute("qnaPagingDTO") QnaPagingDTO qnaPagingDTO, Model model) {

		model.addAttribute("qna", qnaService.getQna(bno));
	}
	
	@GetMapping("/qnagetFiles/{bno}")
	@ResponseBody
	public ResponseEntity<List<FileInfoDTO>> getQnaFiles(@PathVariable long bno) {
		
		List<FileInfoDTO> fileInfoDTOs = qnaService.getAttachFiles(bno);
		
		if (fileInfoDTOs == null) {
			return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<List<FileInfoDTO>>(fileInfoDTOs, HttpStatus.OK);
      
   }

	@GetMapping("/qnamodify")
	public void showQnaModify(long bno,
								@ModelAttribute("qnaPagingDTO") QnaPagingDTO qnaPagingDTO, 
								Model model) {
		
		model.addAttribute("qna", qnaService.getQnaDetailModify(bno));
		model.addAttribute("qnaPagingDTO", qnaPagingDTO);
		
	}

	@Transactional
	@PostMapping("/qnamodify")
	public String modifyQna(QnaDTO qnaDTO, QnaPagingDTO qnaPagingDTO, Model model) {
		
		if(qnaDTO.getAttachFileList() == null) {
			qnaService.modifyQna(qnaDTO);
			qnaService.deleteQnaAllAttachFiles(qnaDTO.getBno());
			model.addAttribute("qna", qnaService.getQna(qnaDTO.getBno()));
			return "/qna/qnadetail";
		}
		
		qnaService.deleteQnaAllAttachFiles(qnaDTO.getBno());
		removeAttachFiles(qnaService.getAttachFiles(qnaDTO.getBno()));
		qnaService.modifyQna(qnaDTO);
		
		qnaDTO.getAttachFileList().forEach(
				attachFile -> {
					qnaService.registerAttachFile(attachFile, qnaDTO);
				}
		);
		
		model.addAttribute("qna", qnaService.getQna(qnaDTO.getBno()));
		
		return "/qna/qnadetail";
	}


	@GetMapping("/qnadelete")
	public String setQnaDeleted(Long bno, String bwriter, RedirectAttributes redirectAttr, QnaPagingDTO qnaPagingDTO) {
		
		if (qnaService.setQnaDeleted(bno)) {
			redirectAttr.addFlashAttribute("result", "successRemove");
		} else {
			redirectAttr.addFlashAttribute("result", "failRemove");
		}
		
		redirectAttr.addAttribute("pageNum", qnaPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", qnaPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", qnaPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", qnaPagingDTO.getKeyword());
		
		return "redirect:/qna/qnalist";

	}
	
	@PostMapping("/qnaremove")
	@Transactional
	public String removeQna(Long bno, String bwriter, 
							RedirectAttributes redirectAttr, 
							QnaPagingDTO qnaPagingDTO) {

		if (qnaService.removeQna(bno)) {
			removeAttachFiles(qnaService.getAttachFiles(bno));
			redirectAttr.addFlashAttribute("result", "successRemove");
			
		} else {
			redirectAttr.addFlashAttribute("result", "failRemove");
		}

		redirectAttr.addAttribute("pageNum", qnaPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", qnaPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", qnaPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", qnaPagingDTO.getKeyword());
		
		return "redirect:/qna/qnalist";
	}

	
	//업로드 파일 삭제 내부 메서드 
	private void removeAttachFiles(List<FileInfoDTO> attachFileList) {

		if (attachFileList == null || attachFileList.size() == 0) {
			return;
		}

		attachFileList.forEach(attachFile -> {
			Path file = Paths.get(attachFile.getUploadPath() + "/" + attachFile.getUuid());
			try {
				Files.deleteIfExists(file);

				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get(attachFile.getUploadPath() + "/s_" + attachFile.getUuid());
					Files.delete(thumbnail);
				}

			} catch (Exception e) {
				System.out.println("오류: " + e.getMessage());
			}

		});

	}
	
	
	@GetMapping("/faqregister")
	public String showFaqRegisterPage() {
		
		return "/qna/faqregister";
	}
	
	@PostMapping("/faqregister")
	public String registerNewFaq(FaqDTO faqDTO, RedirectAttributes redirectAttr) {
		
		long bno = faqService.getLastfaq() + 1 ;
		faqDTO.setBno(bno);
		faqService.registerFaq(faqDTO) ;
		
		redirectAttr.addFlashAttribute("result", bno);

		return "redirect:/qna/qnalist";
	}

	@GetMapping("/faqdetail")
	public void showFaqDetail(@RequestParam("bno") Long bno, Model model) {
		model.addAttribute("faq", faqService.getFaq(bno));
	}

	@GetMapping("/faqmodify")
	public void showFaqModify(Long bno, FaqDTO faqDTO, Model model) {
		model.addAttribute("faq", faqService.getFaqDetailModify(bno));
	}

	@PostMapping("/faqmodify")
	public String modifyFaq(FaqDTO faqDTO, RedirectAttributes redirectAttr, Model model) {
		
		faqService.modifyFaq(faqDTO);
		model.addAttribute("faq", faqService.getFaq(faqDTO.getBno()));
		
		return "/qna/faqdetail";
	}
	
	@PostMapping("/faqdelete")
	public String setQnaDeleted(Long bno, RedirectAttributes redirectAttr, FaqDTO faqDTO) {

		if (faqService.removeFaq(bno)) {
			redirectAttr.addFlashAttribute("result", "successRemove");
		} else {
			redirectAttr.addFlashAttribute("result", "failRemove");
		}

		return "redirect:/qna/qnalist";

	}
	
	 @PostMapping("/faqremove")
	 
	 public String removeFaq(@RequestParam("bno") long bno, RedirectAttributes redirectAttr) {

		 if (faqService.removeFaq(bno)) {
			 redirectAttr.addFlashAttribute("result", "successRemove");
		 }
			return "redirect:/qna/qnalist";
	 }

		
	
	}
