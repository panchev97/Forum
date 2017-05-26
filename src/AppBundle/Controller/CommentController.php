<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Comment;
use AppBundle\Entity\Topic;
use AppBundle\Form\CommentType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class CommentController extends Controller
{
    /**
     * @Route("/{id}/comment/add", name="comment_add")
     * @param Request $request
     * @param Topic $topic
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function addCommentAction(Request $request, Topic $topic)
    {
        $comment = new Comment();
        $comment->setTopic($topic);

        $form = $this->createForm(CommentType::class, $comment);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $user = $this->get('security.token_storage')->getToken()->getUser();

            $comment->setDateCreated(new \DateTime());
            $comment->setUser($user);

            $em = $this->getDoctrine()->getManager();
            $em->persist($comment);
            $em->flush();


            $this->addFlash(
                'notice',
                'Comment Added Successfully !'
            );
        }
        return $this->render('comments/comment.add.html.twig', array(
            'commentsForm' => $form->createView()
        ));
    }
}
