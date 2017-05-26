<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Category;
use AppBundle\Form\CategoryType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class CategoryController extends Controller
{
    /**
     * @Route("/category/add", name="category_add")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function addCategoryAction(Request $request)
    {
        $category = new Category();

        $form = $this->createForm(CategoryType::class, $category);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($category);
            $em->flush();

            $categoryName = $category->getName();

            $this->addFlash(
                'notice',
                'Category ' . $categoryName . ' Added Successfully'
            );
            return $this->redirectToRoute('categories_list');
        }

        return $this->render(':categories:add.category.html.twig', array(
            'categoryForm' => $form->createView()
        ));
    }

    /**
     * @Route("categories/list", name="categories_list")
     */
    public function listCategoriesAction()
    {
        $categories = $this->getDoctrine()->getRepository('AppBundle:Category')->findAll();

        return $this->render('categories/list.categories.html.twig', array(
            'categories' => $categories
        ));
    }

    /**
     * @Route("category/topics/{id}")
     * @param $id
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function listEachCategoryTopics($id)
    {
        $category = $this->getDoctrine()->getRepository('AppBundle:Category')->find($id);

        $categoryTopics = $category->getTopics();

        return $this->render('topics/list.category.topics.html.twig', array(
            'topics' => $categoryTopics
        ));
    }

}
