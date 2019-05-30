import React from 'react'
import styled from 'styled-components'
import tw from 'tailwind.macro'
import { Parallax } from 'react-spring/renderprops-addons.cjs'

// Components
import Layout from '../components/Layout'
import ProjectCard from '../components/ProjectCard'

// Elements
import Inner from '../elements/Inner'
import { Title, BigTitle, Subtitle } from '../elements/Titles'

// Views
import Hero from '../views/Hero'
import Projects from '../views/Projects'
import About from '../views/About'
import Contact from '../views/Contact'

import avatar from '../images/avatar.jpg'

const ProjectsWrapper = styled.div`
  ${tw`flex flex-wrap justify-between mt-8`};
  display: grid;
  grid-gap: 4rem;
  grid-template-columns: repeat(2, 1fr);
  @media (max-width: 1200px) {
    grid-gap: 3rem;
  }
  @media (max-width: 900px) {
    grid-template-columns: 1fr;
    grid-gap: 2rem;
  }
`

const AboutHero = styled.div`
  ${tw`flex flex-col lg:flex-row items-center mt-8`};
`

const Avatar = styled.img`
  ${tw`rounded-full w-32 xl:w-48 shadow-lg h-auto`};
`

const AboutSub = styled.span`
  ${tw`text-white pt-12 lg:pt-0 lg:pl-12 text-2xl lg:text-3xl xl:text-4xl`};
`

const AboutDesc = styled.p`
  ${tw`text-grey-light text-lg md:text-xl lg:text-2xl font-sans pt-6 md:pt-12 text-justify`};
`

const ContactText = styled.p`
  ${tw`text-grey-light font-sans text-xl md:text-2xl lg:text-3xl`};
`

const Footer = styled.footer`
  ${tw`text-center text-grey absolute pin-b p-6 font-sans text-md lg:text-lg`};
`

const Index = () => (
  <React.Fragment>
    <Layout />
    <Parallax pages={5}>
      <Hero offset={0}>
        <BigTitle>
          Hello, <br /> I'm Caio.
        </BigTitle>
        <Subtitle>
          I'm a developer creating high-quality mobile experiences.
        </Subtitle>
      </Hero>
      <Projects offset={1}>
        <Title>Projects</Title>
        <ProjectsWrapper>
          <ProjectCard
            title="e-SUS AB Atividade Coletiva"
            link="https://play.google.com/store/apps/details?id=br.gov.saude.ac"
            bg="linear-gradient(to right, rgb(84, 60, 203) 0%, rgb(84, 200, 168) 100%)"
          >
            Android app created for Brazil's Ministry of Health to help health
            professionals organize their public activities
          </ProjectCard>
          <ProjectCard
            title="SISMOB Cidadão"
            link="https://sismobcidadao.saude.gov.br"
            bg="linear-gradient(to right, rgb(230, 134, 0) 0%, rgb(230, 192, 0) 100%)"
          >
            Android and iOS app created for Brazil's Ministry of Health to let
            any citizen audit health care buildings constructions
          </ProjectCard>
          <ProjectCard
            title="ABVTEX Self-Evaluation"
            bg="linear-gradient(to right, rgb(0, 71, 130) 0%, rgb(0, 146, 69) 100%)"
          >
            Android and iOS app created for ABVTEX (Brazilian Association of
            Textile Retail) to measure its member's compliance with the
            association's regulations
          </ProjectCard>
          <ProjectCard
            title="To be announced"
            bg="linear-gradient(to right, rgb(128, 0, 128) 0%, rgb(75, 0, 130) 100%)"
          >
            Soon...
          </ProjectCard>
        </ProjectsWrapper>
      </Projects>
      <About offset={3}>
        <Title>About</Title>
        <AboutHero>
          <Avatar src={avatar} alt="Picture of Caio" />
          <AboutSub>
            The English language can not fully capture the depth and complexity
            of my thoughts. So I'm incorporating Emoji into my speech to better
            express myself. Winky face.
          </AboutSub>
        </AboutHero>
        <AboutDesc>
          You know the way you feel when you see a picture of two otters holding
          hands? That's how you're gonna feel every day. My mother cried the day
          I was born because she knew she’d never be prettier than me. You
          should make me your campaign manager. I was born for politics. I have
          great hair and I love lying. Captain? The kids want to know where
          Paulie the Pigeon is. I told them he got sucked up into an airplane
          engine, is that all right?
        </AboutDesc>
      </About>
      <Contact offset={4}>
        <Inner>
          <Title>Get in touch</Title>
          <ContactText>
            Say <a href="mailto:hello@caiopo.com">Hi</a> or find me on other
            platforms:{' '}
            <a href="https://www.linkedin.com/in/caiopo/">LinkedIn</a> &{' '}
            <a href="https://github.com/caiopo">GitHub</a>
          </ContactText>
        </Inner>
        <Footer>
          &copy; 2019 by Gatsby Starter Portfolio Cara.{' '}
          <a href="https://github.com/LekoArts/gatsby-starter-portfolio-cara">
            Github Repository
          </a>
          . Made by <a href="https://www.lekoarts.de">LekoArts</a>.
        </Footer>
      </Contact>
    </Parallax>
  </React.Fragment>
)

export default Index
