<?php

namespace App\Controller;

use App\Repository\BatimentRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Batiment;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class
BatimentController extends AbstractController
{
    #[Route('/batiment', name: 'app_batiment')]
    public function index(): Response
    {
        return $this->render('batiment/index.html.twig', [
            'controller_name' => 'BatimentController',
        ]);
    }

    #[Route('/batiment/list', name: 'app_batiment_list')]
    public function getBatiments(EntityManagerInterface $entityManager): Response
    {
        $repository = $entityManager->getRepository(Batiment::class);

        $batiments = $repository->findAll();
        return $this->render('batiment/list.html.twig', [
            'batiments' => $batiments,
        ]);
    }
}
