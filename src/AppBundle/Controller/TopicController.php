<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Topic;
use AppBundle\Form\TopicType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class TopicController extends Controller
{
    /**
     * @Route("/topic/add", name="topic_add")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function addTopicAction(Request $request)
    {
        $topic = new Topic();

        $form = $this->createForm(TopicType::class, $topic);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $topic->setDateCreated(new \DateTime());
            $user = $this->get('security.token_storage')->getToken()->getUser();
            $topic->setUser($user);

            $em = $this->getDoctrine()->getManager();
            $em->persist($topic);
            $em->flush();

            $this->addFlash(
                'notice',
                'Topic Added Successfully !'
            );

            return $this->redirectToRoute('topics_list');

        }

        return $this->render('topics/add.topic.html.twig', array(
            'topicForm' => $form->createView()
        ));
    }

    /**
     * @Route("/topics/list", name="topics_list")
     */
    public function listTopicsAction()
    {
        $topics = $this->getDoctrine()->getRepository('AppBundle:Topic')->findAll();

        return $this->render('topics/list.topics.html.twig', array(
            'topics' => $topics
        ));
    }

    /**
     * @Route("/topic/{id}", name="topic_details")
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function topicDetailsAction($id)
    {
        $topic = $this->getDoctrine()->getRepository('AppBundle:Topic')->find($id);

        return $this->render('topics/topic.details.html.twig', array(
            'topic' => $topic
        ));
    }
}
