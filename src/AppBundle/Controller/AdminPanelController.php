<?php

namespace AppBundle\Controller;

use AppBundle\Form\EditCategoryType;
use AppBundle\Form\EditTopicType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class AdminPanelController extends Controller
{
    /**
     * @Route("/admin")
     */
    public function adminPanelAction()
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {
            return $this->render('admin/admin.panel.html.twig');
        } else {
            return $this->redirectToRoute('home');
        }
    }

    /**
     * @Route("/admin/users", name="admin_users")
     */
    public function administrateUsersAction()
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {
            $users = $this->getDoctrine()->getRepository('AppBundle:User')->findAll();

            return $this->render('admin/admin.users.html.twig', array(
                'users' => $users
            ));
        } else {
            return $this->redirectToRoute('home');
        }
    }

    /**
     * @Route("/admin/user/delete/{id}")
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function deleteUserAction($id)
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {
            $em = $this->getDoctrine()->getManager();
            $user = $em->getRepository('AppBundle:User')->find($id);

            $em->remove($user);
            $em->flush();

            $this->addFlash(
                'notice',
                'User Deleted Successfully !'
            );
            return $this->redirectToRoute('admin_users');
        } else {
            return $this->redirectToRoute('home');
        }
    }


    /**
     * @Route("/admin/categories", name="admin_categories")
     */
    public function administrateCategoriesAction()
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {

            $categories = $this->getDoctrine()->getRepository('AppBundle:Category')->findAll();

            return $this->render('admin/admin.categories.html.twig', array(
                'categories' => $categories
            ));
        } else {
            return $this->redirectToRoute('home');
        }
    }
    /**
     * @Route("/admin/category/edit/{id}")
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function editCategoryAction(Request $request, $id)
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {
            $category = $this->getDoctrine()->getRepository('AppBundle:Category')->find($id);
            $category->setName($category->getName());

            $form = $this->createForm(EditCategoryType::class, $category);
            $form->handleRequest($request);

            if ($form->isValid()) {
                $name = $form['name']->getData();

                $em = $this->getDoctrine()->getManager();
                $category = $em->getRepository('AppBundle:Category')->find($id);

                $category->setName($name);

                $em->flush();

                $this->addFlash(
                    'notice',
                    'Category Edited Successfully !'
                );

                return $this->redirectToRoute('admin_categories');
            }

            return $this->render('admin/admin.edit.category.html.twig', array(
                'editCategoryForm' => $form->createView()
            ));
        } else {
            return $this->redirectToRoute('home');
        }

    }

    /**
     * @Route("/admin/category/delete/{id}")
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function deleteCategoryAction($id)
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {
            $em = $this->getDoctrine()->getManager();
            $category = $em->getRepository('AppBundle:Category')->find($id);

            $em->remove($category);
            $em->flush();

            $this->addFlash(
                'notice',
                'Category Deleted Successfully !'
            );

            return $this->redirectToRoute('admin_categories');
        } else {
            return $this->redirectToRoute('home');
        }
    }

    /**
     * @Route("/admin/topics", name="admin_topics")
     */
    public function administrateTopicsAction()
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {

            $topics = $this->getDoctrine()->getRepository('AppBundle:Topic')->findAll();

        return $this->render('admin/admin.topics.html.twig', array(
            'topics' => $topics
        ));
        } else {
            return $this->redirectToRoute('home');
        }
    }

    /**
     * @Route("/admin/topic/edit/{id}")
     * @param Request $request
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function editTopicAction(Request $request, $id)
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {
            $topic = $this->getDoctrine()->getRepository('AppBundle:Topic')->find($id);

            $topic->setTitle($topic->getTitle());

            $form = $this->createForm(EditTopicType::class, $topic);
            $form->handleRequest($request);

            if ($form->isValid()) {
                $title = $form['title']->getData();
                $description = $form['description']->getData();

                $em = $this->getDoctrine()->getManager();
                $topic = $em->getRepository('AppBundle:Topic')->find($id);

                $topic->setTitle($title);
                $topic->setDescription($description);

                $em->flush();

                $this->addFlash(
                    'notice',
                    'Topic Edited Successfully !'
                );

                return $this->redirectToRoute('admin_topics');
            }

            return $this->render('admin/admin.edit.topic.html.twig', array(
                'editTopicForm' => $form->createView()
            ));
        } else {
            return $this->redirectToRoute('home');
        }

    }

    /**
     * @Route("/admin/topic/delete/{id}")
     * @param $id
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function deleteTopicAction($id)
    {
        if ($this->isGranted('ROLE_SUPER_ADMIN')) {

            $em = $this->getDoctrine()->getManager();
            $topic = $em->getRepository('AppBundle:Topic')->find($id);

            $em->remove($topic);
            $em->flush();

            $this->addFlash(
                'notice',
                'Topic Deleted Successfully !'
            );

            return $this->redirectToRoute('admin_topics');
        } else {
            return $this->redirectToRoute('home');
        }
    }
}
