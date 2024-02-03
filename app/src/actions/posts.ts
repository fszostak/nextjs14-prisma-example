'use server'
import prisma from '@/lib/prisma'

export const getPosts = async () => {
  try {
    const res = await prisma.post.findMany()
    console.log(res)
    return res
  } catch (e) {
    console.log('getPosts', e)
  }
}

export const createPost = async (post) => {
  try {
    const result = await prisma.post.create({
      data: post,
    })
  } catch (e) {
    console.log('createPost', e)
  }
}

export const updatePost = async (id, post) => {
  try {
    const result = await prisma.post.update({
      where: {
        id,
      },
      data: post,
    })
  } catch (e) {
    console.log('updatePost', e)
  }
}

export const deletePost = async (id) => {
  try {
    const result = await prisma.post.delete({
      where: {
        id,
      },
    })
  } catch (e) {
    console.log('deletePost', e)
  }
}
